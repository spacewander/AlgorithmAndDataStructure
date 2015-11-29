// return index of the first element which is not less than given value
var lower_bound = function (seq, value) {
  var count = seq.length;
  var start = 0;
  while (count > 0) {
    var i = start;
    var step = Math.floor(count / 2);
    i += step;
    if (seq[i] < value) {
      start = i + 1;
      count -= step + 1;
    }
    else {
      count = step;
    }
  }
  return start;
};

var upper_bound = function (seq, value) {
  var count = seq.length;
  var start = 0;
  while (count > 0) {
    var i = start;
    var step = Math.floor(count / 2);
    i += step;
    if (seq[i] <= value) {
      start = i + 1;
      count -= step + 1;
    }
    else {
      count = step;
    }
  }
  return start;
};

var binary_search = function (seq, value) {
  var i = lower_bound(seq, value);
  return i != seq.length && seq[i] == value;
};

var equal_range = function (seq, value) {
  return {
    lower_bound: lower_bound(seq, value),
    upper_bound: upper_bound(seq, value)
  };
};

module.exports = {
  lower_bound: lower_bound,
  upper_bound: upper_bound,
  binary_search: binary_search,
  equal_range: equal_range
};
