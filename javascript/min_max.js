var max = function (a, b) {
  return a > b ? a : b;
};

var min = function (a, b) {
  return a > b ? b : a;
};

var minmax = function (a, b) {
  return a > b ? {min: b, max: a} : {min: a, max: b};
};

var max_element = function (ary) {
  return Array.prototype.reduce.call(ary, max);
};

var min_element = function (ary) {
  return Array.prototype.reduce.call(ary, min);
};

var minmax_element = function (ary) {
  return {
    min_element: min_element(ary),
    max_element: max_element(ary)
  };
};

var lexicographical_compare = function (ary1, ary2) {
  if (ary2.length < ary1.length)
    return false;
  for (var i = 0; i < ary1.length; i++) {
    if (ary1[i] < ary2[i]) {
      return true;
    }
    else if (ary2[i] < ary1[i]) {
      return false;
    }
  }
  return true;
};

var is_permutation = function (ary1, ary2) {
  if (ary1.length != ary2.length) return false;
  elements = {};
  Array.prototype.forEach.call(ary1, function(e) {
    if (elements[e]) {
      elements[e] += 1;
    }
    else {
      elements[e] = 1;
    }
  });
  for (var i = 0; i < ary2.length; i++) {
    if (elements[ary2[i]] && elements[ary2[i]] > 0) {
      elements[ary2[i]]--;
    }
    else {
      return false;
    }
  }
  return true;
};

var next_permutation = function (ary) {
  if (ary.length <= 1) return false;
  var pos1, pos2, tmp, part;
  var i = ary.length - 1;
  while (true) {
    pos1 = i--;
    if (ary[i] < ary[pos1]) {
      pos2 = ary.length - 1;
      while (ary[i] >= ary[pos2])
        pos2--;
      tmp = ary[i];
      ary[i] = ary[pos2];
      ary[pos2] = tmp;
      var pivot = (ary.length - pos1) / 2;
      for (var j = 0; j < pivot; j++) {
        tmp = ary[ary.length - j - 1];
        ary[ary.length - j - 1] = ary[pos1 + j];
        ary[pos1 + j] = tmp;
      }
      return true;
    }
    if (i === 0) {
      Array.prototype.reverse.call(ary);
      return false;
    }
  }
};

var prev_permutation = function (ary) {
  if (ary.length <= 1) return false;
  var pos1, pos2, tmp, part;
  var i = ary.length - 1;
  while (true) {
    pos1 = i--;
    if (ary[pos1] < ary[i]) {
      pos2 = ary.length - 1;
      while (ary[pos2] >= ary[i])
        pos2--;
      tmp = ary[i];
      ary[i] = ary[pos2];
      ary[pos2] = tmp;
      var pivot = (ary.length - pos1) / 2;
      for (var j = 0; j < pivot; j++) {
        tmp = ary[ary.length - j - 1];
        ary[ary.length - j - 1] = ary[pos1 + j];
        ary[pos1 + j] = tmp;
      }
      return true;
    }
    if (i === 0) {
      Array.prototype.reverse.call(ary);
      return false;
    }
  }
};

module.exports = {
  max: max,
  min: min,
  max_element: max_element,
  min_element: min_element,
  minmax: minmax,
  minmax_element: minmax_element,
  lexicographical_compare: lexicographical_compare,
  is_permutation: is_permutation,
  next_permutation: next_permutation,
  prev_permutation: prev_permutation
};
