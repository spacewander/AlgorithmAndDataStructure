var should = require('chai').should();
var algos = require('./non_modifying_sequence');

var ary = function() {
  return [1, 2, 3, 4, 5];
};

var map = function() {
  return {'a': 1, 'b': 2};
};

describe('Non-modifying sequence algorithms', function(){

  it('all_of', function(){
    algos.all_of(ary(), function(e) {
      return e < 3;
    }).should.be.equal(false);
  });

  it('any_of', function(){
    algos.any_of(ary(), function(e) {
      return e < 3;
    }).should.be.equal(true);
  });

  it('none_of', function(){
    algos.none_of(ary(), function(e) {
      return e < 3;
    }).should.be.equal(false);
  });

  describe('for_each', function(){
    it('Array', function() {
      var ary = [1, 2, 3];
      var emptyAry = [];
      algos.for_each(ary, function(e) {
        emptyAry.push(e + 1);
      });
      JSON.stringify(emptyAry).should.be.equal(JSON.stringify([2, 3, 4]));
    });

    it('Other collections', function(){
      var map = { 'a' : 1, 'b' : 2 };
      var mapValues = [];
      algos.for_each(map, function(e) {
        mapValues.push(e + 1);
      });
      JSON.stringify(mapValues).should.be.equal(JSON.stringify([2, 3]));
    });
  });

  describe('count', function(){
    it('Array', function(){
      algos.count(ary(), 3).should.be.equal(1);
    });

    it('Array(count_if)', function(){
      algos.count_if(ary(), function(e){
        return e < 3;
      }).should.be.equal(2);
    });

    it('Other collections', function(){
      algos.count(map(), 1).should.be.equal(1);
    });

    it('Other collections(count_if)', function(){
      algos.count_if(map(), function(e){
        return e != 1;
      }).should.be.equal(1);
    });
  });

  it('mismatch', function(){
    var ary2 = [1, 3, 4];
    algos.mismatch(ary(), ary2).should.be.equal(1);
  });

  it('equal', function(){
    algos.equal(ary(), [1, 2, 3, 4, 5]).should.be.equal(true);
  });

  it('find', function(){
    algos.find(map(), 1).should.be.equal('a');
  });

  it('find_if', function(){
    algos.find_if(map(), function(e){
      return e === 1;
    }).should.be.equal('a');
  });

  it('find_if_not', function(){
    algos.find_if_not(map(), function(e){
      return e !== 1;
    }).should.be.equal('a');
  });

  it('find_end', function(){
    var ary = [1, 2, 1, 2, 3];
    var sub = [1, 2];
    var nonExistedSubsequence = [2, 4];
    algos.find_end(ary, [1]).should.be.equal(2);
    algos.find_end(ary, [2]).should.be.equal(3);
    algos.find_end(ary, sub).should.be.equal(2);
    algos.find_end(ary, nonExistedSubsequence).should.be.equal(-1);
  });

  it('find_first_of', function(){
    algos.find_first_of(ary(), [10, 2, 3]).should.be.equal(1);
    algos.find_first_of(ary(), [10, 20]).should.be.equal(-1);
  });

  it('search', function(){
    algos.search(ary(), [3, 4], function(a, b){
      return a === b;
    }).should.be.equal(2);
    algos.search(ary(), [3, 4, 2], function(a, b){
      return a === b;
    }).should.be.equal(-1);
  });

  it('search_n', function(){
    algos.search_n(ary(), 2, 3, function(a, b){
      return a === b;
    }).should.be.equal(-1);
    algos.search_n(ary(), 1, 3, function(a, b){
      return a === b;
    }).should.be.equal(2);
  });
});
