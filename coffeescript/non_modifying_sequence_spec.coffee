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

