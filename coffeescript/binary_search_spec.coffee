should = require('chai').should()
Algos = require './binary_search'

Ary = ->
  [1, 2, 3, 4, 4.5]

describe 'Binary search algorithms', ->
  
  it 'lower_bound', ->
    Algos.lower_bound(Ary(), 3).should.be.equal 2
    Algos.lower_bound(Ary(), 2.5).should.be.equal 2
    Algos.lower_bound(Ary(), 1).should.be.equal 0
    Algos.lower_bound(Ary(), 5).should.be.equal 5

  it 'upper_bound', ->
    Algos.upper_bound(Ary(), 3).should.be.equal 3
    Algos.upper_bound(Ary(), 2.5).should.be.equal 2
    Algos.upper_bound(Ary(), 4).should.be.equal 4

  it 'binary_search', ->
    Algos.binary_search(Ary(), 3) .should.be.equal true
    Algos.binary_search(Ary(), 0) .should.be.equal false
    Algos.binary_search(Ary(), 5) .should.be.equal false

  it 'equal_range', ->
    Algos.equal_range(Ary(), 3).lower_bound.should.be.equal 2
    Algos.equal_range(Ary(), 3).upper_bound.should.be.equal 3
    Algos.equal_range(Ary(), 2.5).lower_bound.should.be.equal 2
    Algos.equal_range(Ary(), 2.5).upper_bound.should.be.equal 2
