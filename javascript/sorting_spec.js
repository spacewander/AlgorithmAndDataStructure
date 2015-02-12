var should = require('chai').should();
var Algos = require('./sorting');

var Ary = function() {
  return [1, 2, 3, 5, 2];
};

describe('Sorting algorithms', function(){

  it('is_sorted_until', function(){
    Algos.is_sorted_until(Ary()).should.be.equal(4);
    var sortedAry = [1, 2, 3];
    Algos.is_sorted_until(sortedAry).should.be.equal(sortedAry.length);
  });

  it('is_sorted', function(){
    Algos.is_sorted(Ary()).should.be.equal(false);
    var sortedAry = [1, 2, 3];
    Algos.is_sorted(sortedAry).should.be.equal(true);
  });

  it('sort', function(){
    var ary = Ary();
    Algos.sort(ary);
    JSON.stringify(ary).should.be.equal(JSON.stringify([1, 2, 2, 3, 5]));
  });

  it('partial_sort', function(){
    var ary = Ary();
    Algos.partial_sort(ary, 3);
    ary.splice(3, ary.length - 3);
    JSON.stringify(ary).should.be.equal(JSON.stringify([1, 2, 2]));
  });

  it('partial_sort_copy', function(){
    var ary = Ary();
    var res = Algos.partial_sort_copy(ary, 3);
    JSON.stringify(ary).should.be.equal(JSON.stringify(Ary()));
    JSON.stringify(res).should.be.equal(JSON.stringify([1, 2, 2]));
  });

  it('stable_sort', function(){
    var pairs = [[1, 0], [2, 1], [2, 3], [2, 2], [1, 2], [3, 1]];
    // the standard Array.sort is not stable
    Algos.stable_sort(pairs, function(a, b) {
      return a[0] < b[0];
    });
    JSON.stringify(pairs).should.be.equal(
      JSON.stringify([[1, 0], [1, 2], [2, 1], [2, 3], [2, 2], [3, 1]])
    );
  });

  it('nth_element', function(){
    var ary = Ary();
    JSON.stringify(Algos.nth_element(ary, 3))
      .should.be.equal(JSON.stringify(2));
    JSON.stringify(Algos.nth_element(ary, 4))
      .should.be.equal(JSON.stringify(2));
  });
});

