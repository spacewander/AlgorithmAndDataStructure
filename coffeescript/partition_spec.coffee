should = require('chai').should()
Algos = require './partition'

Ary = ->
  [1, 2, 3, 5, 2]

less_than_4 = (a) ->
  a < 4

describe 'Partition algorithms', ->
  
  it 'is_partitioned', ->
    Algos.is_partitioned(Ary(), less_than_4).should.be.equal false
    Algos.is_partitioned([1, 2, 3], less_than_4).should.be.equal true

  it 'partition_point', ->
    Algos.partition_point(Ary(), less_than_4).should.be.equal 3
    Algos.partition_point([1, 2, 3], less_than_4).should.be.equal 3

  it 'parition', ->
    ary = [1, 2, 4, 2]
    Algos.parition ary, less_than_4
    ary[3].should.be.equal 4

  it 'parition_copy', ->
    ary = Algos.parition_copy Ary(), less_than_4
    ary[4].should.be.equal 5

  it 'stable_partition', ->
    ary = [1, 2, 4, 2]
    Algos.stable_partition ary, less_than_4
    JSON.stringify(ary).should.be.equal JSON.stringify([1, 2, 2, 4])

