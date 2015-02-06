var should = require('chai').should();
var Algos = require('./set');

var Ary1 = function() {
  return [1, 2, 3, 4];
};

var Ary2 = function() {
  return [3, 4, 5, 6];
};

describe('Set algorithms', function(){
  
  it('merge', function(){
    JSON.stringify(Algos.merge(Ary1(), Ary2()))
      .should.be.equal(JSON.stringify([1, 2, 3, 4, 5, 6]));
  });

  it('inplace_merge', function(){
    JSON.stringify(Algos.inplace_merge(Ary1(), Ary2()))
      .should.be.equal(JSON.stringify([1, 2, 3, 4, 5, 6])); 
  });

  it('includes', function(){
    Algos.includes(Ary1(), [1, 2]).should.be.equal(true);
    Algos.includes(Ary1(), [5, 6]).should.be.equal(false);
    Algos.includes(Ary1(), []).should.be.equal(true);
  });

  it('union', function(){
    JSON.stringify(Algos.union(Ary1(), Ary2()))
      .should.be.equal(JSON.stringify([1, 2, 3, 4, 5, 6]));
  });

  it('difference', function(){
    JSON.stringify(Algos.difference(Ary1(), Ary2()))
      .should.be.equal(JSON.stringify([1, 2]));
  });

  it('symmetric_difference', function(){
    JSON.stringify(Algos.symmetric_difference(Ary1(), Ary2()))
      .should.be.equal(JSON.stringify([1, 2, 5, 6]));
  });

  it('intersection', function(){
    JSON.stringify(Algos.intersection(Ary1(), Ary2()))
      .should.be.equal(JSON.stringify([3, 4]));
  });

});
