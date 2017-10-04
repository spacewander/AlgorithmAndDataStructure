var should = require('chai').should();
var Algos = require('../dist/minMax');

var Ary = function () {
  return [2, 3, 1, 4, 5];
};

describe('min/max algorithms', function(){

  it('min', function(){
    Algos.min(2, 3).should.be.equal(2);
  });

  it('max', function(){
    Algos.max(2, 3).should.be.equal(3);
  });

  it('minmax', function(){
    Algos.minmax(2, 3).min.should.be.equal(2);
    Algos.minmax(2, 3).max.should.be.equal(3);
  });

  it('maxElement', function(){
    Algos.maxElement(Ary()).should.be.equal(5);
  });

  it('minElement', function(){
    Algos.minElement(Ary()).should.be.equal(1);
  });

  it('minmaxElement', function(){
    Algos.minmaxElement(Ary()).max.should.be.equal(5);
    Algos.minmaxElement(Ary()).min.should.be.equal(1);
  });

  it('lexicographicalCompare', function(){
    var a = 'abcd';
    var b = 'abce';
    var c = 'abcde';
    Algos.lexicographicalCompare(a, b).should.be.equal(true);
    Algos.lexicographicalCompare(a, c).should.be.equal(true);
    Algos.lexicographicalCompare(c, a).should.be.equal(false);
  });

  it('isPermutation', function(){
    Algos.isPermutation(Ary(), [1, 2, 3, 4, 5]).should.be.equal(true);
    Algos.isPermutation(Ary(), [1, 2, 2, 4, 5]).should.be.equal(false);
    Algos.isPermutation(Ary(), [1, 2, 3, 4]).should.be.equal(false);
  });

  it('nextPermutation', function(){
    var a = Ary();
    Algos.nextPermutation(a);
    JSON.stringify(a).should.be.equal(JSON.stringify([2, 3, 1, 5, 4]));
  });

  it('prevPermutation', function(){
    var a = Ary();
    Algos.prevPermutation(a);
    JSON.stringify(a).should.be.equal(JSON.stringify([2, 1, 5, 4, 3]));

    a = Ary();
    Algos.nextPermutation(a);
    Algos.prevPermutation(a);
    JSON.stringify(a).should.be.equal(JSON.stringify(Ary()));
  });
});
