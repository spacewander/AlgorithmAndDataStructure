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
  var gap = src.length - dest.length;
  for (var i = 0; gap >= 0 && i < dest.length; i++)
    src[i + gap] = dest[i];
  return gap < 0 ? -1 : gap;
};

var move = function(src, dest) {
  for (var i in src)
    if (dest[i] === undefined)
      dest[i] = src[i];
};

var move_backward = function(src, dest) {
  var gap = src.length - dest.length;
  for (var i = 0; gap >= 0 && i < dest.length; i++)
    src[i + gap] = dest[i];
  return gap < 0 ? -1 : gap;
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

var remove = function(ary, value) {
  remove_if(ary, function(e){
    return e === value;
  });
};

var remove_copy_if = function(coll, cb) {
  var i;
  var copy = coll.constructor();
  if (coll.hasOwnProperty('length')) {
    var j = 0;
    for (i = 0; i < coll.length; i++) {
      if (cb(coll[i]))
        copy[j++] = coll[i];
    }
  }
  else {
    for (i in coll) {
      if (coll.hasOwnProperty(i) && cb(coll[i]))
        copy[i] = coll[i];
    }
  }
  return copy;
};

var remove_copy = function(ary, value) {
  return remove_copy_if(ary, function(e){
    return e === value;
  });
};

var replace_if = function(coll, cb, after) {
  if (coll.hasOwnProperty('length')) {
    for (var i = 0; i < coll.length; i++) {
      if (cb(coll[i]))
        coll[i] = after;
    }
  }
  else {
    for (var j in coll) {
      if (coll.hasOwnProperty(j) && cb(coll[j]))
        coll[j] = after;
    }
  }
};

var replace = function(coll, before, after) {
  replace_if(coll, function(e){
    return e === before;
  }, after);
};

var replace_copy_if = function(coll, cb, after) {
  var copy = coll.constructor();
  if (coll.hasOwnProperty('length')) {
    for (var i = 0; i < coll.length; i++) {
      if (cb(coll[i]))
        copy[i] = after;
      else
        copy[i] = coll[i];
    }
  }
  else {
    for (var j in coll) {
      if (coll.hasOwnProperty(j) && cb(coll[j]))
        copy[j] = after;
      else
        copy[j] = coll[j];
    }
  }
  return copy;
};

var replace_copy = function(coll, before, after) {
  return replace_copy_if(coll, function(e){
    return e === before;
  }, after);
};

// can we implement swap function in javascript? SEE ALSO:
// http://stackoverflow.com/questions/18817810/is-it-possible-to-write-a-numeric-swap-function-in-javascript

var swap_range = function(a, b, start, end) {
  if (start < 0 || end > a.length || end > b.length)
    return;
  var tmp;
  for (var i = start; i < end; i++) {
    tmp = a[i];
    a[i] = b[i];
    b[i] = tmp;
  }
};

var reverse = function(ary) {
  var middle = ary.length / 2;
  for (var i = 0; i < middle; i++) {
    var tmp = ary[ary.length - i - 1];
    ary[ary.length - i - 1] = ary[i];
    ary[i] = tmp;
  }
};

var reverse_copy = function(ary) {
  var length = ary.length;
  if (length <= 1) return ary;
  var res = new Array(length);
  for (var i = length - 1; i >= 0; i--) {
    res[length - i - 1] = ary[i];
  }
  return res;
};

var shuffle = function(ary) {
  var length = ary.length;
  for (var i = 0; i < length; i++) {
    random = Math.floor(Math.random() * length);
    var tmp = ary[i];
    ary[i] = ary[random];
    ary[random] = ary[i];
  }
};

var rotate = function(ary, pivot) {
  Array.prototype.push.apply(ary, Array.prototype.splice.call(ary, 0, pivot));
};

var rotate_copy = function(ary, pivot) {
  return Array.prototype.concat.call(
    Array.prototype.slice.call(ary, pivot, ary.length),
    Array.prototype.slice.call(ary, 0, pivot));
};

var unique = function(ary) {
  var copy = ary.constructor();
  var i, j = 1;
  var preValue = copy[0] = ary[0];
  for (i = 1; i < ary.length; i++) {
    if (ary[i] != preValue) {
      preValue = copy[j] = ary[i];
      j++;
    }
  }
  while (i-- > j)
    Array.prototype.shift.call(ary);
  for (i = 0; i < j; i++)
    ary[i] = copy[i];
};

var unique_copy = function(ary) {
  var copy = ary.constructor();
  var i, j = 1;
  var preValue = copy[0] = ary[0];
  for (i = 1; i < ary.length; i++) {
    if (ary[i] != preValue) {
      preValue = copy[j] = ary[i];
      j++;
    }
  }
  return copy;
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
  remove: remove,
  remove_if: remove_if,
  remove_copy: remove_copy,
  remove_copy_if: remove_copy_if,
  replace: replace,
  replace_if: replace_if,
  replace_copy: replace_copy,
  replace_copy_if: replace_copy_if,
  swap_range: swap_range,
  reverse: reverse,
  reverse_copy: reverse_copy,
  shuffle: shuffle,
  rotate: rotate,
  rotate_copy: rotate_copy,
  unique: unique,
  unique_copy: unique_copy
};
