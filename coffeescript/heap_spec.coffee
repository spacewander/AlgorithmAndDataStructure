should = require('chai').should()
Algos = require './heap'

Ary = ->
  [2, 3, 1, 4, 5]

describe 'Heap algorithms', ->
  
  it 'is_heap', ->
    Algos.is_heap(Ary()).should.be.equal false
    ary = [1, 2, 3, 4, 5]
    Algos.is_heap(ary).should.be.equal true

  it 'is_heap_until', ->
    Algos.is_heap_until(Ary()).should.be.equal 2
    ary = [1, 2, 3, 4, 5]
    Algos.is_heap_until(ary).should.be.equal ary.length

  it 'make_heap', ->
    ary = Ary()
    Algos.is_heap(ary).should.be.equal false
    Algos.make_heap ary
    Algos.is_heap(ary).should.be.equal true

  it 'pop_heap', ->
    ary = [1, 3, 2, 5, 4]
    Algos.pop_heap(ary).should.be.equal 1
    ary.length.should.be.equal 4
    Algos.is_heap(ary).should.be.equal true

  it 'push_heap', ->
    ary = [1, 2, 5, 4]
    Algos.push_heap(ary, 3)
    Algos.is_heap(ary).should.be.equal true
    ary.length.should.be.equal 5

  it 'sort_heap', ->
    ary = Ary()
    Algos.sort_heap ary
    JSON.stringify(ary).should.be.equal JSON.stringify([1, 2, 3, 4, 5])
