should = require('chai').should()
Algos = require('./non_modifying_sequence')

Ary = ->
  [1, 2, 3, 4, 5]

Map = ->
  {'a': 1, 'b': 2}

describe 'Non-modifying Sequence', ->

  it 'all_of', ->
    Algos.all_of Ary(), (e) ->
      e < 3
    .should.be.equal false

  it 'any_of', ->
    Algos.any_of Ary(), (e) ->
      e < 3
    .should.be.equal true

  it 'none_of', ->
    Algos.none_of Ary(), (e) ->
      e < 3
    .should.be.equal false

  describe 'for_each', ->
    it 'Array', ->
      ary = [1, 2, 3]
      emptyAry = []
      Algos.for_each ary, (e) ->
        emptyAry.push(e + 1)
      JSON.stringify(emptyAry).should.be.equal(JSON.stringify([2, 3, 4]))

    it 'Other collections', ->
      map = {'a' : 1, 'b' : 2}
      mapValues = []
      Algos.for_each map, (e) ->
        mapValues.push(e + 1)
      JSON.stringify(mapValues).should.be.equal(JSON.stringify([2, 3]))

  describe 'count', ->
    it 'Array', ->
      Algos.count(Ary(), 3).should.be.equal(1)

    it 'Array(count_if)', ->
      Algos.count_if Ary(), (e) ->
        e < 3
      .should.be.equal 2

    it 'Other collections', ->
      Algos.count(Map(), 1).should.be.equal(1)

    it 'Other collections(count_if)', ->
      Algos.count_if Map(), (e) ->
        e != 1
      .should.be.equal 1

  it 'mismatch', ->
    ary1 = Ary()
    ary2 = [1, 3, 4]
    Algos.mismatch(ary1, ary2).should.be.equal 1
    Algos.mismatch(ary1, ary1).should.be.equal ary1.length

  it 'equal', ->
    Algos.equal(Ary(), [1, 2, 3, 4, 5]).should.be.equal true

  it 'find', ->
    Algos.find(Map(), 1).should.be.equal 'a'

  it 'find_if', ->
    Algos.find_if Map(), (e) ->
      e == 1
    .should.be.equal 'a'

  it 'find_if_not', ->
    Algos.find_if_not Map(), (e) ->
      e != 1
    .should.be.equal 'a'

  it 'find_end', ->
    ary = [1, 2, 1, 2, 3]
    sub = [1, 2]
    nonExistedSubsequence = [2, 4]
    Algos.find_end(ary, [1]).should.be.equal 2
    Algos.find_end(ary, [2]).should.be.equal 3
    Algos.find_end(ary, sub).should.be.equal 2
    Algos.find_end(ary, nonExistedSubsequence).should.be.equal -1

  it 'find_first_of', ->
    Algos.find_first_of(Ary(), [10, 2, 3]).should.be.equal 1
    Algos.find_first_of(Ary(), [10, 20]).should.be.equal -1

  it 'search', ->
    Algos.search Ary(), [3, 4], (a, b) ->
      a == b
    .should.be.equal 2
    Algos.search Ary(), [3, 4, 2], (a, b) ->
      a == b
    .should.be.equal -1

  it 'search_n', ->
    Algos.search_n Ary(), 2, 3, (a, b) ->
      a == b
    .should.be.equal -1
    Algos.search_n Ary(), 1, 3, (a, b) ->
      a == b
    .should.be.equal 2


