should = require('chai').should()
Algos = require './set'

Ary1 = ->
  [1, 2, 3, 4]

Ary2 = ->
  [3, 4, 5, 6]

describe 'Set algorithms', ->

  it 'merge', ->
    JSON.stringify(Algos.merge(Ary1(), Ary2()))
      .should.be.equal JSON.stringify([1, 2, 3, 3, 4, 4, 5, 6])

  it 'inplace_merge', ->
    JSON.stringify(Algos.inplace_merge(Ary1(), Ary2()))
      .should.be.equal JSON.stringify([1, 2, 3, 3, 4, 4, 5, 6])

  it 'includes', ->
    Algos.includes(Ary1(), [1, 2]).should.be.equal true
    Algos.includes(Ary1(), [5, 6]).should.be.equal false
    Algos.includes(Ary1(), []).should.be.equal true

  it 'union', ->
    JSON.stringify(Algos.union(Ary1(), Ary2()))
      .should.be.equal JSON.stringify([1, 2, 3, 4, 5, 6])

  it 'difference', ->
    JSON.stringify(Algos.difference(Ary1(), Ary2()))
      .should.be.equal JSON.stringify([1, 2])

  it 'symmetric_difference', ->
    JSON.stringify(Algos.symmetric_difference(Ary1(), Ary2()))
      .should.be.equal JSON.stringify([1, 2, 5, 6])

  it 'intersection', ->
    JSON.stringify(Algos.intersection(Ary1(), Ary2()))
      .should.be.equal JSON.stringify([3, 4])
