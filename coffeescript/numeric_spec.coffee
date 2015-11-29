should = require('chai').should()
Algos = require './numeric'

Ary = ->
  [1, 2, 3]

describe 'Numeric algorithms', ->
  
  it 'itoa', ->
    g = Algos.itoa 1
    g().should.be.equal 1
    g().should.be.equal 2

  it 'accumulate', ->
    Algos.accumulate [], 1, (x, y) ->
      x * y
    .should.be.equal 1
    Algos.accumulate Ary(), 1, (x, y) ->
      x * y
    .should.be.equal 6

  it 'inner_production', ->
    Algos.inner_production([], [], 1).should.be.equal 1
    Algos.inner_production(Ary(), Ary(), 1).should.be.equal 15

  it 'adjacent_difference', ->
    JSON.stringify(Algos.adjacent_difference([]))
      .should.be.equal JSON.stringify([])
    JSON.stringify(Algos.adjacent_difference(Ary()))
      .should.be.equal JSON.stringify([1, 1, 1])

  it 'partial_sum', ->
    JSON.stringify(Algos.partial_sum([]))
      .should.be.equal JSON.stringify([])
    JSON.stringify(Algos.partial_sum(Ary()))
      .should.be.equal JSON.stringify([1, 3, 6])
