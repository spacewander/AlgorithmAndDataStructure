var should = require('chai').should();
var Algos = require('./modifying_sequence');

var Ary = function() {
  return [1, 2, 3, 4, 5];
};

var Hash = function() {
  return {'a': 1, 'b': 2};
};

describe('Modifying sequence algorithms', function(){
  
  it('copy', function(){
    var hash = {};
    Algos.copy(Hash(), hash);
    JSON.stringify(hash).should.be.equal(JSON.stringify({'a': 1, 'b': 2}));
  });

  it('copy_if', function(){
    var hash = {};
    Algos.copy_if(Hash(), hash, function(e){
      return e === 1;
    });
    JSON.stringify(hash).should.be.equal(JSON.stringify({'a': 1}));
  });

  it('copy_n', function(){
    var ary = new Array(3);
    Algos.copy_n(ary, 3, 3);
    JSON.stringify(ary).should.be.equal(JSON.stringify([3, 3, 3]));
  });

  it('copy_backward', function(){
    var ary = new Array(3);
    Algos.copy_backward(ary, Ary()).should.be.equal(-1);
    ary = new Array(5);
    Algos.copy_backward(ary, Ary()).should.be.equal(0);
    JSON.stringify(ary).should.be.equal(JSON.stringify([1, 2, 3, 4, 5]));
  });

});
