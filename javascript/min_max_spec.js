var should = require('chai').should();
var Algos = require('./min_max');

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

  it('max_element', function(){
    Algos.max_element(Ary()).should.be.equal(5);
  });

  it('min_element', function(){
    Algos.min_element(Ary()).should.be.equal(1);
  });

  it('minmax_element', function(){
    Algos.minmax_element(Ary()).max_element.should.be.equal(5);
    Algos.minmax_element(Ary()).min_element.should.be.equal(1);
  });

  it('lexicographical_compare', function(){
    var a = 'abcd';
    var b = 'abce';
    var c = 'abcde';
    Algos.lexicographical_compare(a, b).should.be.equal(true);
    Algos.lexicographical_compare(c, a).should.be.equal(false);
    Algos.lexicographical_compare(a, c).should.be.equal(true);
  });

  it('is_permutation', function(){
    Algos.is_permutation(Ary(), [1, 2, 3, 4, 5]).should.be.equal(true);
    Algos.is_permutation(Ary(), [1, 2, 2, 4, 5]).should.be.equal(false);
    Algos.is_permutation(Ary(), [1, 2, 3, 4]).should.be.equal(false);
  });

  it('next_permutation', function(){
    var a = Ary();
    Algos.next_permutation(a);
    JSON.stringify(a).should.be.equal(JSON.stringify([2, 3, 1, 5, 4]));
  });

  it('prev_permutation', function(){
    var a = Ary();
    Algos.next_permutation(a);
    Algos.prev_permutation(a);
    JSON.stringify(a).should.be.equal(JSON.stringify(Ary()));
  });
});
