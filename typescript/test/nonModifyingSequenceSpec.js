var should = require('chai').should();
var algos = require('../dist/nonModifyingSequence');

var ary = function() {
  return [1, 2, 3, 4, 5];
};

var map = function() {
  return {'a': 1, 'b': 2};
};

describe('Non-modifying sequence algorithms', function(){

  it('allOf', function(){
    algos.allOf(ary(), function(e) {
      return e < 3;
    }).should.be.equal(false);
  });

  it('anyOf', function(){
    algos.anyOf(ary(), function(e) {
      return e < 3;
    }).should.be.equal(true);
  });

  it('noneOf', function(){
    algos.noneOf(ary(), function(e) {
      return e < 3;
    }).should.be.equal(false);
  });

  describe('forEach', function(){
    it('Array', function() {
      var ary = [1, 2, 3];
      var emptyAry = [];
      algos.forEach(ary, function(e) {
        emptyAry.push(e + 1);
      });
      JSON.stringify(emptyAry).should.be.equal(JSON.stringify([2, 3, 4]));
    });

    it('Other collections', function(){
      var map = { 'a' : 1, 'b' : 2 };
      var mapValues = [];
      algos.forEach(map, function(e) {
        mapValues.push(e + 1);
      });
      JSON.stringify(mapValues).should.be.equal(JSON.stringify([2, 3]));
    });
  });

  describe('count', function(){
    it('Array', function(){
      algos.count(ary(), 3).should.be.equal(1);
    });

    it('Array(countIf)', function(){
      algos.countIf(ary(), function(e){
        return e < 3;
      }).should.be.equal(2);
    });

    it('Other collections', function(){
      algos.count(map(), 1).should.be.equal(1);
    });

    it('Other collections(countIf)', function(){
      algos.countIf(map(), function(e){
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

  it('adjacentFind', function(){
    algos.adjacentFind([1, 1, 2], function(a, b){
      return a === b
    }).should.be.equal(0);
    algos.adjacentFind([1, 2, 2], function(a, b){
      return a === b
    }).should.be.equal(1);
    algos.adjacentFind([1, 2, 3], function(a, b){
      return a === b
    }).should.be.equal(-1);
    algos.adjacentFind([1], function(a, b){
      return a === b
    }).should.be.equal(-1);
    algos.adjacentFind([], function(a, b){
      return a === b
    }).should.be.equal(-1);
  });

  it('find', function(){
    algos.find(map(), 1).should.be.equal('a');
  });

  it('findIf', function(){
    algos.findIf(map(), function(e){
      return e === 1;
    }).should.be.equal('a');
  });

  it('findIfNot', function(){
    algos.findIfNot(map(), function(e){
      return e !== 1;
    }).should.be.equal('a');
  });

  it('findEnd', function(){
    var ary = [1, 2, 1, 2, 3];
    var sub = [1, 2];
    var nonExistedSubsequence = [2, 4];
    algos.findEnd(ary, [1]).should.be.equal(2);
    algos.findEnd(ary, [2]).should.be.equal(3);
    algos.findEnd(ary, [2, 3]).should.be.equal(3);
    algos.findEnd(ary, [2, 2, 3]).should.be.equal(-1);
    algos.findEnd(ary, sub).should.be.equal(2);
    algos.findEnd(sub, ary).should.be.equal(-1);
    algos.findEnd([1, 2, 1], [1, 2]).should.be.equal(0);
    algos.findEnd(ary, nonExistedSubsequence).should.be.equal(-1);
  });

  it('findFirstOf', function(){
    algos.findFirstOf(ary(), [10, 2, 3]).should.be.equal(1);
    algos.findFirstOf(ary(), [10, 20]).should.be.equal(-1);
  });

  it('search', function(){
    algos.search(ary(), [], function(a, b){
      return a === b;
    }).should.be.equal(0);
    algos.search(ary(), [3, 4], function(a, b){
      return a === b;
    }).should.be.equal(2);
    algos.search([3, 2, 3, 4], [3, 4], function(a, b){
      return a === b;
    }).should.be.equal(2);
    algos.search(ary(), [3, 4, 2], function(a, b){
      return a === b;
    }).should.be.equal(-1);

    algos.search([3, 4], [3, 4, 2], function(a, b){
      return a === b;
    }).should.be.equal(-1);
    algos.search([1, 2, 3, 4], [3, 4, 2], function(a, b){
      return a === b;
    }).should.be.equal(-1);
  });

  it('searchN', function(){
    algos.searchN(ary(), 2, 3, function(a, b){
      return a === b;
    }).should.be.equal(-1);
    algos.searchN(ary(), 1, 3, function(a, b){
      return a === b;
    }).should.be.equal(2);
  });
});
