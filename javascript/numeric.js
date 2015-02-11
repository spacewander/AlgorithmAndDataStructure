var itoa = function (v) {
  var value = v;
  return function(){
    return value++;
  };
};

var accumulate = function (ary, init, func) {
  return Array.prototype.reduce.call(ary, func, init);
};

// require ary1.length === ary2.length
var inner_production = function (ary1, ary2, init) {
  return Array.prototype.reduce.call(ary1, function(prev, cur, idx) {
    return prev + cur * ary2[idx];
  }, init);
};

var adjacent_difference = function (ary) {
  var res = [ary[0]];
  for (var i = 1; i < ary.length; i++)
    res.push(ary[i] - ary[i - 1]);
  return res;
};

var partial_sum = function (ary) {
  var res = [ary[0]];
  var sum = function (prev, cur) {
    res.push(prev + cur);
    return prev + cur;
  };
  Array.prototype.reduce.call(ary, sum);
  return res;
};

module.exports = {
  itoa: itoa,
  accumulate: accumulate,
  inner_production: inner_production,
  adjacent_difference: adjacent_difference,
  partial_sum: partial_sum
};
