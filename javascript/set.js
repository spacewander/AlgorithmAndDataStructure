var merge = function (a, b) {
  var res = [];
  var i = 0;
  var j = 0;
  while (i < a.length && j < b.length) {
    if (a[i] < b[j]) {
      res.push(a[i]);
      i++;
    }
    else if (a[i] == b[j]) {
      res.push(a[i]);
      res.push(b[j]);
      i++;
      j++;
    }
    else {
      res.push(b[j]);
      j++;
    }
  }
  if (i == a.length) {
    return res.concat(Array.prototype.slice.call(b, j));
  }
  return res.concat(Array.prototype.slice.call(a, i));
};

var inplace_merge = function (a, b) {
  var j = 0;
  for (var i = 0; i < a.length; i++) {
    while (a[i] >= b[j] && j < b.length) {
      Array.prototype.splice.call(a, i, 0, b[j]);
      j++;
      i++;
    }
  }
  while (j < b.length)
    Array.prototype.push.call(a, b[j++]);
  return a;
};

var includes = function (a, b) {
  for (var i = 0; i < b.length; i++) {
    if (Array.prototype.indexOf.call(a, b[i]) === -1)
      return false;
  }
  return true;
};

var aInb = function (a, b) {
  return Array.prototype.indexOf.call(b, a) !== -1;
};

var union = function (a, b) {
  var res = Array.prototype.filter.call(a, function(e) {
    return !aInb(e, b);
  });
  return res.concat(Array.prototype.slice.call(b));
};

var difference = function (a, b) {
  var res = Array.prototype.filter.call(a, function(e) {
    return !aInb(e, b);
  });
  return res;
};

var symmetric_difference = function (a, b) {
  var res1 = Array.prototype.filter.call(a, function(e) {
    return !aInb(e, b);
  });
  var res2 = Array.prototype.filter.call(b, function(e) {
    return !aInb(e, a);
  });
  return res1.concat(res2);
};

var intersection = function (a, b) {
  var res = Array.prototype.filter.call(a, function(e) {
    return aInb(e, b);
  });
  return res;
};

module.exports = {
  merge: merge,
  inplace_merge: inplace_merge,
  includes: includes,
  union: union,
  difference: difference,
  symmetric_difference: symmetric_difference,
  intersection: intersection
};
