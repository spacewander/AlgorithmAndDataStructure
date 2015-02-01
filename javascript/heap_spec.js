var should = require('chai').should();
var Algos = require('./heap');

var Ary = function() {
  return [2, 3, 1, 4, 5];
};

describe('Heap algorithms', function(){

  it('is_heap', function(){
    Algos.is_heap(Ary()).should.be.equal(false);
    var ary = [1, 2, 3, 4, 5];
    Algos.is_heap(ary).should.be.equal(true);
  });

  it('is_heap_until', function(){
    Algos.is_heap_until(Ary()).should.be.equal(2);
    var ary = [1, 2, 3, 4, 5];
    Algos.is_heap_until(ary).should.be.equal(ary.length);
  });

  it('make_heap', function(){
    var ary = Ary();
    Algos.is_heap(ary).should.be.equal(false);
    Algos.make_heap(ary);
    Algos.is_heap(ary).should.be.equal(true);
  });

  it('pop_heap', function(){
    var ary = [1, 3, 2, 5, 4];
    Algos.pop_heap(ary).should.be.equal(1);
    ary.length.should.be.equal(4);
    Algos.is_heap(ary).should.be.equal(true);
  });

  it('push_heap', function(){
    var ary = [1, 2, 5, 4];
    Algos.push_heap(ary, 3);
    Algos.is_heap(ary).should.be.equal(true);
  });

  it('sort_heap', function(){
    var ary = Ary();
    Algos.sort_heap(ary);
    JSON.stringify(ary).should.be.equal(JSON.stringify([1, 2, 3, 4, 5]));
  });
});
