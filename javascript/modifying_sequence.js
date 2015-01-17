var copy = function(coll, dest) {
  for (var i in coll)
    if (dest[i] === undefined) 
      dest[i] = coll[i];
};

var copy_if = function(coll, dest, cb) {
  for (var i in coll)
    if (dest[i] === undefined && cb(coll[i]))
      dest[i] = coll[i];
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

module.exports = {
  copy: copy,
  copy_if: copy_if,
  copy_n: copy_n,
  copy_backward: copy_backward
};
