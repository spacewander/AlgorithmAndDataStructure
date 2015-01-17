var NonModifyingSequence = require('./non_modifying_sequence');

var copy = function(src, dest) {
  for (var i in src)
    if (dest[i] === undefined) 
      dest[i] = src[i];
};

var copy_if = function(src, dest, cb) {
  for (var i in src)
    if (dest[i] === undefined && cb(src[i]))
      dest[i] = src[i];
};

var copy_n = function(dest, n, value) {
  for (var i = 0; i < n; i++) {
    dest[i] = value;
  }
};

var copy_backward = function(src, dest) {
  var j = 0;
  for (var i = src.length - dest.length; i >= 0 && i < src.length; i++, j++) {
    src[i] = dest[j];
  }
  return src.length - dest.length >= 0 ? src.length - dest.length : -1;
};

var move = function(src, dest) {
  for (var i in src)
    if (dest[i] === undefined) 
      dest[i] = src[i];
};

var move_backward = function(src, dest) {
  var j = 0;
  for (var i = src.length - dest.length; i >= 0 && i < src.length; i++, j++) {
    src[i] = dest[j];
  }
  return src.length - dest.length >= 0 ? src.length - dest.length : -1;
};

var fill = function(ary, value) {
  for (var i = 0; i < ary.length; i++)
    ary[i] = value;
};

var fill_n = function(ary, n, value) {
  for (var i = 0; i < n; i++)
    ary[i] = value;
};

var transform = function(coll, cb) {
  NonModifyingSequence.for_each(coll, cb);
  return coll;
};

var generate = function(ary, g) {
  for (var i = 0; i < ary.length; i++)
    ary[i] = g();
};

var generate_n = function(ary, n, g) {
  for (var i = 0; i < n; i++)
    ary[i] = g();
};

var remove_if = function(coll, cb) {
  var i;
  if (coll.hasOwnProperty('length')) {
    var copy = coll.constructor();
    var j = 0;
    for (i = 0; i < coll.length; i++) {
      if (!cb(coll[i]))
        copy[j++] = coll[i];
    }
    copy.length = j;
    while (i-- > j)
      Array.prototype.shift.call(coll);
    for (i = 0; i < j; i++)
      coll[i] = copy[i];
  }
  else {
    for (i in coll) {
      if (coll.hasOwnProperty(i) && cb(coll[i]))
        delete coll[i];
    }
  }
};

module.exports = {
  copy: copy,
  copy_if: copy_if,
  copy_n: copy_n,
  copy_backward: copy_backward,
  move: move,
  move_backward: move_backward,
  fill: fill,
  fill_n: fill_n,
  transform: transform,
  generate: generate,
  generate_n: generate_n,
  remove_if: remove_if
};
