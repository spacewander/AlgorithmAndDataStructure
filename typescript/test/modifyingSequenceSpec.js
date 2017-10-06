var should = require('chai').should();
var Algos = require('../dist/modifyingSequence');

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

  it('copyIf', function(){
    var hash = {};
    Algos.copyIf(Hash(), hash, function(e){
      return e === 1;
    });
    JSON.stringify(hash).should.be.equal(JSON.stringify({'a': 1}));
  });

  it('copyN', function(){
    var ary = new Array(3);
    Algos.copyN(ary, 3, 3);
    JSON.stringify(ary).should.be.equal(JSON.stringify([3, 3, 3]));
  });

  it('copyBackward', function(){
    var ary = new Array(3);
    Algos.copyBackward(Ary(), ary).should.be.equal(-1);
    ary = new Array(5);
    Algos.copyBackward(Ary(), ary).should.be.equal(0);
    JSON.stringify(ary).should.be.equal(JSON.stringify([1, 2, 3, 4, 5]));
    ary = new Array(6);
    ary[0] = 1;
    Algos.copyBackward(Ary(), ary).should.be.equal(1);
    JSON.stringify(ary).should.be.equal(JSON.stringify([1, 1, 2, 3, 4, 5]));
  });

  it('fill', function(){
    var ary = new Array(3);
    Algos.fill(ary, 3);
    JSON.stringify(ary).should.be.equal(JSON.stringify([3, 3, 3]));
  });

  it('fillN', function(){
    var ary = new Array(3);
    Algos.fillN(ary, 2, 3);
    JSON.stringify(ary).should.be.equal(JSON.stringify([3, 3, null]));
  });

  it('transform', function(){
    var ary = Ary()
    JSON.stringify(Algos.transform(ary, function(e){
      return e + 1
    }));
    JSON.stringify(ary).should.be.equal(JSON.stringify([2, 3, 4, 5, 6]));
  });

  it('generate', function(){
    var ary = new Array(3);
    Algos.generate(ary, function(){
      return 3;
    });
    JSON.stringify(ary).should.be.equal(JSON.stringify([3, 3, 3]));
  });

  it('generateN', function(){
    var ary = new Array(3);
    Algos.generateN(ary, 2, function(){
      return 3;
    });
    JSON.stringify(ary).should.be.equal(JSON.stringify([3, 3, null]));
  });

  it('remove', function(){
    var ary = [1, 2, 3];
    Algos.remove(ary, 3);
    JSON.stringify(ary).should.be.equal(JSON.stringify([1, 2]));
  });

  it('removeIf', function(){
    var ary = [1, 2, 3];
    Algos.removeIf(ary, function(e){
      return e < 2;
    });
    JSON.stringify(ary).should.be.equal(JSON.stringify([2, 3]));
    var hash = {'a': 1, 'b': 2};
    Algos.removeIf(hash, function(e){
      return e != 1;
    });
    JSON.stringify(hash).should.be.equal(JSON.stringify({'a': 1}));
  });

  it('removeCopy', function(){
    var ary = [1, 2, 3];
    JSON.stringify(Algos.removeCopy(ary, 3))
      .should.be.equal(JSON.stringify([3]));
  });

  it('removeCopyIf', function(){
    var ary = [1, 2, 3];
    ary = Algos.removeCopyIf(ary, function(e){
      return e < 2;
    });
    JSON.stringify(ary).should.be.equal(JSON.stringify([1]));
    var hash = {'a': 1, 'b': 2};
    hash = Algos.removeCopyIf(hash, function(e){
      return e != 1;
    });
    JSON.stringify(hash).should.be.equal(JSON.stringify({'b': 2}));
  });

  it('replace', function(){
    var ary = [1, 2, 3, 3];
    Algos.replace(ary, 3, 2);
    JSON.stringify(ary).should.be.equal(JSON.stringify([1, 2, 2, 2]));
  });

  it('replaceIf', function(){
    var ary = [1, 2, 3];
    Algos.replaceIf(ary, function(e){
      return e < 2;
    }, 2);
    JSON.stringify(ary).should.be.equal(JSON.stringify([2, 2, 3]));
    var hash = {'a': 1, 'b': 2};
    Algos.replaceIf(hash, function(e){
      return e != 2;
    }, 2);
    JSON.stringify(hash).should.be.equal(JSON.stringify({'a': 2, 'b': 2}));
  });

  it('replaceCopy', function(){
    var ary = [1, 2, 3, 3];
    JSON.stringify(Algos.replaceCopy(ary, 3, 2))
      .should.be.equal(JSON.stringify([1, 2, 2, 2]));
  });

  it('replaceCopyIf', function(){
    var ary = [1, 2, 3];
    ary = Algos.replaceCopyIf(ary, function(e){
      return e < 2;
    }, 2);
    JSON.stringify(ary).should.be.equal(JSON.stringify([2, 2, 3]));
    var hash = {'a': 1, 'b': 2};
    hash = Algos.replaceCopyIf(hash, function(e){
      return e != 2;
    }, 2);
    JSON.stringify(hash).should.be.equal(JSON.stringify({'a': 2, 'b': 2}));
  });

  it('swapRange', function(){
    var a = [1, 2, 3, 4];
    var b = [4, 3, 2, 1];
    Algos.swapRange(a, b, 1, 3);
    JSON.stringify(a).should.be.equal(JSON.stringify([1, 3, 2, 4]));
    JSON.stringify(b).should.be.equal(JSON.stringify([4, 2, 3, 1]));
  });

  it('reverse', function(){
    var ary = [1, 2, 3];
    Algos.reverse(ary);
    ary.toString().should.be.equal([3, 2, 1].toString());
  });

  it('reverseCopy', function(){
    Algos.reverseCopy(Ary()).toString().
      should.be.equal(Ary().reverse().toString());
  });

  it('shuffle', function(){
    Algos.shuffle(Ary());
  });

  it('rotate', function(){
    var ary = [1, 2, 3, 4];
    Algos.rotate(ary, 2);
    ary.toString().should.be.equal([3, 4, 1, 2].toString());
  });

  it('rotateCopy', function(){
    Algos.rotateCopy(Ary(), 2).toString()
      .should.be.equal([3, 4, 5, 1, 2].toString());
  });

  it('unique', function(){
    var duplicate = [1, 1, 2, 3, 3];
    Algos.unique(duplicate);
    JSON.stringify(duplicate).should.be.equal(JSON.stringify([1, 2, 3]));
  });

  it('uniqueCopy', function(){
    var duplicate = [1, 1, 2, 3, 3];
    JSON.stringify(Algos.uniqueCopy(duplicate))
      .should.be.equal(JSON.stringify([1, 2, 3]));
  });
});
