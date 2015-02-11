var should = require('chai').should();
var Algos = require('./numeric');

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
    Algos.accumulate(Ary(), 1, function(x, y) {
      return x * y;
    }).should.be.equal(6);
  });

  it('inner_production', function(){
    Algos.inner_production(Ary(), Ary(), 0).should.be.equal(14);
  });

  it('adjacent_difference', function(){
    JSON.stringify(Algos.adjacent_difference(Ary()))
      .should.be.equal(JSON.stringify([1, 1, 1]));
  });

  it('partial_sum', function(){
    JSON.stringify(Algos.partial_sum(Ary()))
      .should.be.equal(JSON.stringify([1, 3, 6]));
  });
});
