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

  // move* is implemented the same as copy*
  it('move', function(){
    var hash = {};
    Algos.move(Hash(), hash);
    JSON.stringify(hash).should.be.equal(JSON.stringify({'a': 1, 'b': 2}));
  });

  it('move_backward', function(){
    var ary = new Array(3);
    Algos.move_backward(ary, Ary()).should.be.equal(-1);
    ary = new Array(5);
    Algos.move_backward(ary, Ary()).should.be.equal(0);
    JSON.stringify(ary).should.be.equal(JSON.stringify([1, 2, 3, 4, 5]));
  });

  it('fill', function(){
    var ary = new Array(3);
    Algos.fill(ary, 3);
    JSON.stringify(ary).should.be.equal(JSON.stringify([3, 3, 3]));
  });

  it('fill_n', function(){
    var ary = new Array(3);
    Algos.fill_n(ary, 2, 3);
    JSON.stringify(ary).should.be.equal(JSON.stringify([3, 3, null]));
  });

  it('transform', function(){
    var emptyAry = [];
    JSON.stringify(Algos.transform(Ary(), function(e){
      emptyAry.push(e + 1);
    })).should.be.equal(JSON.stringify(Ary()));
    JSON.stringify(emptyAry).should.be.equal(JSON.stringify([2, 3, 4, 5, 6]));
  });

  it('generate', function(){
    var ary = new Array(3);
    Algos.generate(ary, function(){
      return 3;
    });
    JSON.stringify(ary).should.be.equal(JSON.stringify([3, 3, 3]));
  });

  it('generate_n', function(){
    var ary = new Array(3);
    Algos.generate_n(ary, 2, function(){
      return 3;
    });
    JSON.stringify(ary).should.be.equal(JSON.stringify([3, 3, null]));
  });

  it('remove_if', function(){
    var ary = [1, 2, 3];
    Algos.remove_if(ary, function(e){
      return e < 2;
    });
    JSON.stringify(ary).should.be.equal(JSON.stringify([2, 3]));
    var hash = {'a': 1, 'b': 2};
    Algos.remove_if(hash, function(e){
      return e != 1;
    });
    JSON.stringify(hash).should.be.equal(JSON.stringify({'a': 1}));
  });
});
