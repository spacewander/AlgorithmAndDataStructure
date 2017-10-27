var should = require('chai').should();
var Algos = require('../dist/numeric');

var Ary = function () {
  return [1, 2, 3];
};

describe('numeric algorithms', function(){

  it('itoa', function(){
    var g =  Algos.itoa(3);
    g().should.be.equal(3);
    g().should.be.equal(4);
  });

  it('accumulate', function(){
    Algos.accumulate([], 1, function(x, y) {
      return x * y;
    }).should.be.equal(1);
    Algos.accumulate(Ary(), 1, function(x, y) {
      return x * y;
    }).should.be.equal(6);
  });

  it('innerProduction', function(){
    Algos.innerProduction([], [], 0).should.be.equal(0);
    Algos.innerProduction(Ary(), Ary(), 0).should.be.equal(14);
  });

  it('adjacentDifference', function(){
    JSON.stringify(Algos.adjacentDifference([]))
      .should.be.equal(JSON.stringify([]));
    JSON.stringify(Algos.adjacentDifference(Ary()))
      .should.be.equal(JSON.stringify([1, 1, 1]));
  });

  it('partialSum', function(){
    JSON.stringify(Algos.partialSum([]))
      .should.be.equal(JSON.stringify([]));
    JSON.stringify(Algos.partialSum(Ary()))
      .should.be.equal(JSON.stringify([1, 3, 6]));
  });
});
