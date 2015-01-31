var should = require('chai').should();
var Algos = require('./partition');

var Ary = function() {
  return [1, 2, 3, 5, 2];
};

var less_than_4 = function(a) {
  return a < 4;
};

describe('Partition algorithms', function(){

  it('is_partitioned', function(){
    Algos.is_partitioned(Ary(), less_than_4).should.be.equal(false);
    Algos.is_partitioned([1, 2, 3], less_than_4).should.be.equal(true);
  });

  it('partition_point', function(){
    Algos.partition_point(Ary(), less_than_4).should.be.equal(3);
    Algos.partition_point([1, 2, 3], less_than_4).should.be.equal(3);
  });

  it('partition', function(){
    var ary = [1, 2, 4, 2];
    Algos.partition(ary, less_than_4);
    ary[3].should.be.equal(4);
  });

  it('partition_copy', function(){
    var ary = Algos.partition_copy(Ary(), less_than_4);
    ary[4].should.be.equal(5);
  });

  it('stable_partition', function(){
    var ary = [1, 2, 4, 2];
    Algos.stable_partition(ary, less_than_4);
    JSON.stringify(ary).should.be.equal(JSON.stringify([1, 2, 2, 4]));
  });
});

