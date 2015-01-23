should = require('chai').should()
Algos = require './modifying_sequence'

Ary = ->
  [1, 2, 3, 4, 5]

Hash = ->
  {'a': 1, 'b': 2}

describe 'Modifying sequence algorithms', ->
  
  it 'copy', ->
    hash = {}
    Algos.copy Hash(), hash
    JSON.stringify(hash).should.be.equal JSON.stringify({'a': 1, 'b': 2})

  it 'copy_if', ->
    hash = {}
    Algos.copy_if Hash(), hash, (e) ->
      e is 1
    JSON.stringify(hash).should.be.equal JSON.stringify({'a': 1})

  it 'copy_n', ->
    ary = new Array(3)
    Algos.copy_n ary, 3, 3
    JSON.stringify(ary).should.be.equal JSON.stringify([3, 3, 3])

  it 'copy_backward', ->
    ary = new Array(3)
    Algos.copy_backward(ary, Ary()).should.be.equal -1
    ary = new Array(5)
    Algos.copy_backward(ary, Ary()).should.be.equal 0
    JSON.stringify(ary).should.be.equal JSON.stringify([1, 2, 3, 4, 5])

  it 'move', ->
    hash = {}
    Algos.move Hash(), hash
    JSON.stringify(hash).should.be.equal JSON.stringify({'a': 1, 'b': 2})

  it 'mov_backward', ->
    ary = new Array(3)
    Algos.copy_backward(ary, Ary()).should.be.equal -1
    ary = new Array(5)
    Algos.copy_backward(ary, Ary()).should.be.equal 0
    JSON.stringify(ary).should.be.equal JSON.stringify([1, 2, 3, 4, 5])

  it 'transform', ->
    emptyAry = []
    JSON.stringify Algos.transform Ary(), (e) ->
      emptyAry.push e + 1
    .should.be.equal JSON.stringify(Ary())
    JSON.stringify(emptyAry).should.be.equal JSON.stringify([2, 3, 4, 5, 6])

  it 'generate', ->
    ary = new Array(3)
    Algos.generate ary, ->
      3
    JSON.stringify(ary).should.be.equal JSON.stringify([3, 3, 3])

  it 'generate_n', ->
    ary = new Array(3)
    Algos.generate_n ary, 2, ->
      3
    JSON.stringify(ary).should.be.equal JSON.stringify([3, 3, null])
