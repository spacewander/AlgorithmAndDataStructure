var should = require('chai').should();
var Algos = require('../dist/partition');

var Ary = function() {
  return [1, 2, 3, 5, 2];
};

var lessThan4 = function(a) {
  return a < 4;
};

describe('Partition algorithms', function(){

  it('isPartitioned', function(){
    Algos.isPartitioned(Ary(), lessThan4).should.be.equal(false);
    Algos.isPartitioned([1, 2, 3], lessThan4).should.be.equal(true);
  });

  it('partitionPoint', function(){
    Algos.partitionPoint(Ary(), lessThan4).should.be.equal(3);
    Algos.partitionPoint([1, 2, 3], lessThan4).should.be.equal(3);
  });

  it('partition', function(){
    var ary = [1, 2, 4, 2];
    Algos.partition(ary, lessThan4);
    ary[3].should.be.equal(4);
  });

  it('partitionCopy', function(){
    var ary = Algos.partitionCopy(Ary(), lessThan4);
    ary[4].should.be.equal(5);
  });

  it('stablePartition', function(){
    var ary = [1, 2, 4, 2];
    Algos.stablePartition(ary, lessThan4);
    JSON.stringify(ary).should.be.equal(JSON.stringify([1, 2, 2, 4]));
  });
});

