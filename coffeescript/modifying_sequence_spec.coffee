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

  it 'remove', ->
    ary = [1, 2, 3]
    Algos.remove ary, 3
    JSON.stringify(ary).should.be.equal JSON.stringify([1, 2])

  it 'remove_if', ->
    ary = [1, 2, 3]
    Algos.remove_if ary, (e) ->
      e < 2
    JSON.stringify(ary).should.be.equal JSON.stringify([2, 3])

    hash = {'a': 1, 'b': 2}
    Algos.remove_if hash, (e) ->
      e != 1
    JSON.stringify(hash).should.be.equal JSON.stringify({'a': 1})

  it 'remove_copy', ->
    ary = [1, 2, 3]
    JSON.stringify(Algos.remove_copy(ary, 3))
      .should.be.equal JSON.stringify([3])

  it 'remove_copy_if', ->
    ary = [1, 2, 3]
    ary = Algos.remove_copy_if ary, (e) ->
      e < 2
    JSON.stringify(ary).should.be.equal JSON.stringify([1])
    hash = {'a': 1, 'b': 2}
    hash = Algos.remove_copy_if hash, (e) ->
      e != 1
    JSON.stringify(hash).should.be.equal JSON.stringify({'b': 2})

  it 'replace', ->
    ary = [1, 2, 3, 3]
    Algos.replace ary, 3, 2
    JSON.stringify(ary).should.be.equal JSON.stringify([1, 2, 2, 2])

  it 'replace_if', ->
    ary = [1, 2, 3]
    Algos.replace_if ary, (e) ->
      e < 2
    , 2
    JSON.stringify(ary).should.be.equal JSON.stringify([2, 2, 3])

    hash = {'a': 1, 'b': 2}
    Algos.replace_if hash, (e) ->
      e != 2
    , 2
    JSON.stringify(hash).should.be.equal JSON.stringify({'a': 2, 'b': 2})

  it 'replace_copy', ->
    ary = [1, 2, 3, 3]
    JSON.stringify(Algos.replace_copy(ary, 3, 2))
      .should.be.equal JSON.stringify([1, 2, 2, 2])

  it 'replace_copy_if', ->
    ary = [1, 2, 3]
    ary = Algos.replace_copy_if ary, (e) ->
      e < 2
    , 2
    JSON.stringify(ary).should.be.equal JSON.stringify([2, 2, 3])
    hash = {'a': 1, 'b': 2}
    hash = Algos.replace_copy_if hash, (e) ->
      e != 2
    , 2
    JSON.stringify(hash).should.be.equal JSON.stringify({'a': 2, 'b': 2})

  it 'swap_range', ->
    a = [1, 2, 3, 4]
    b = [4, 3, 2, 1]
    Algos.swap_range a, b, 1, 3
    JSON.stringify(a).should.be.equal JSON.stringify([1, 3, 2, 4])
    JSON.stringify(b).should.be.equal JSON.stringify([4, 2, 3, 1])

  it 'reverse', ->
    ary = [1, 2, 3]
    Algos.reverse ary
    ary.toString().should.be.equal [3, 2, 1].toString()

  it 'reverse_copy', ->
    Algos.reverse_copy(Ary()).toString().
      should.be.equal Ary().reverse().toString()

  it 'shuffle', ->
    Algos.shuffle Ary()

  it 'rotate', ->
    ary = [1, 2, 3, 4]
    Algos.rotate ary, 2
    ary.toString().should.be.equal [3, 4, 1, 2].toString()

  it 'rotate_copy', ->
    Algos.rotate_copy(Ary(), 2).toString().
      should.be.equal [3, 4, 5, 1, 2].toString()

  it 'unique', ->
    duplicate = [1, 1, 2, 2, 3]
    Algos.unique duplicate
    JSON.stringify(duplicate).should.be.equal JSON.stringify([1, 2, 3])

  it 'unique_copy', ->
    duplicate = [1, 1, 2, 2, 3]
    JSON.stringify(Algos.unique_copy(duplicate)).
      should.be.equal JSON.stringify([1, 2, 3])

