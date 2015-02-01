var is_heap = function (seq) {
  if (seq.length === 0) return true;
  for (var i = 1; i < seq.length; i++) {
    if (seq[i] < seq[Math.floor((i - 1) / 2)])
      return false;
  }
  return true;
};

var is_heap_until = function (seq) {
  if (seq.length === 0) return 0;
  for (var i = 1; i < seq.length; i++) {
    if (seq[i] < seq[Math.floor((i - 1) / 2)])
      return i;
  }
  return seq.length;
};

// We construct a min-heap here.
var make_heap = function (seq, func) {
  var left, right, smallest, tmp;
  if (func === undefined) {
    func = function(a, b) {
      return a < b;
    };
  }
  for (var i = Math.floor(seq.length / 2) - 1; i > -1; i--) {
    while (true) {
      left = 2 * i + 1;
      if (left >= seq.length) break;
      smallest = func(seq[left], seq[i]) ? left : i;
      right = left + 1;
      if (right < seq.length)
        smallest = func(seq[right], seq[smallest]) ? right : smallest;
      if (seq[smallest] != seq[i]) {
        tmp = seq[smallest];
        seq[smallest] = seq[i];
        seq[i] = tmp;
        i = smallest;
      }
      else {
        break;
      }
    }
  }
};

var pop_heap = function (seq) {
  var tmp = Array.prototype.shift.call(seq);
  make_heap(seq);
  return tmp;
};

var push_heap = function (seq, value) {
  Array.prototype.push.call(seq, value);
  make_heap(seq);
};

var sort_heap = function (seq, func) {
  var size = seq.length;
  var res = [];
  make_heap(seq, func);
  for (var i = 0; i < size; i++)
    res.push(pop_heap(seq));
  for (var j = 0; j < res.length; j++)
    Array.prototype.push.call(seq, res[j]);
};

module.exports = {
  is_heap: is_heap,
  is_heap_until: is_heap_until,
  make_heap: make_heap,
  pop_heap: pop_heap,
  push_heap: push_heap,
  sort_heap: sort_heap
};
