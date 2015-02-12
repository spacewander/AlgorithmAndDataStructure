should = require('chai').should()
Algos = require './sorting'

Ary = ->
  [1, 2, 3, 5, 2]

describe 'Sorting algorithms', ->
  
  it 'is_sorted_until', ->
    Algos.is_sorted_until(Ary()).should.be.equal 4
    sortedAry = [1, 2, 3]
    Algos.is_sorted_until(sortedAry).should.be.equal sortedAry.length

  it 'is_sorted', ->
    Algos.is_sorted(Ary()).should.be.equal false
    sortedAry = [1, 2]
    Algos.is_sorted(sortedAry).should.be.equal true

  it 'sort', ->
    ary = Ary()
    Algos.sort ary
    JSON.stringify(ary).should.be.equal JSON.stringify([1, 2, 2, 3, 5])

  it 'partial_sort', ->
    ary = Ary()
    Algos.partial_sort(ary, 3)
    ary.splice(3, ary.length - 3)
    JSON.stringify(ary).should.be.equal JSON.stringify([1, 2, 2])

  it 'partial_sort_copy', ->
    ary = Ary()
    res = Algos.partial_sort_copy(ary, 3)
    # should not change the ordinary array
    JSON.stringify(ary).should.be.equal JSON.stringify(Ary())
    JSON.stringify(res).should.be.equal JSON.stringify([1, 2, 2])

  it 'stable_sort', ->
    pairs = [[1, 0], [2, 1], [2, 3], [2, 2], [1, 2], [3, 1]]
    Algos.stable_sort pairs, (a, b) ->
      a[0] < b[0]
    sorted = JSON.stringify [[1, 0], [1, 2], [2, 1], [2, 3], [2, 2], [3, 1]]
    JSON.stringify(pairs).should.be.equal sorted

  it 'nth_element', ->
    ary = Ary()
    JSON.stringify(Algos.nth_element(ary, 3))
      .should.be.equal JSON.stringify(2)
    JSON.stringify(Algos.nth_element(ary, 4))
      .should.be.equal JSON.stringify(2)
