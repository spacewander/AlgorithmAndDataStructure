var should = require('chai').should();
var Algos = require('../dist/binarySearch.js');

var Ary = function() {
  return [1, 2, 3, 4];
};

describe('Binary search algorithms', function(){

  it('lowerBound', function(){
    Algos.lowerBound(Ary(), 3).should.be.equal(2);
    Algos.lowerBound(Ary(), 2.5).should.be.equal(2);
    Algos.lowerBound(Ary(), 1).should.be.equal(0);
    Algos.lowerBound(Ary(), 5).should.be.equal(4);
  });

  it('upperBound', function(){
    Algos.upperBound(Ary(), 3).should.be.equal(3);
    Algos.upperBound(Ary(), 2.5).should.be.equal(2);
    Algos.upperBound(Ary(), 4).should.be.equal(4);
  });

  it('binarySearch', function(){
    Algos.binarySearch(Ary(), 3).should.be.equal(true);
    Algos.binarySearch(Ary(), 0).should.be.equal(false);
    Algos.binarySearch(Ary(), 5).should.be.equal(false);
  });

  it('equalRange', function(){
    Algos.equalRange(Ary(), 3).lowerBound.should.be.equal(2);
    Algos.equalRange(Ary(), 3).upperBound.should.be.equal(3);
    Algos.equalRange(Ary(), 2.5).lowerBound.should.be.equal(2);
    Algos.equalRange(Ary(), 2.5).upperBound.should.be.equal(2);
  });
});
