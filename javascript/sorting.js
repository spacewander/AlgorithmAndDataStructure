var Heap = require('./heap');

// recursion quicksort
var sort = function (seq) {
  var partition = function (seq, start, end) {
    var x = seq[end];
    var i = start - 1;
    var tmp;
    for (var j = start; j < end; j++) {
      if (seq[j] <= x) {
        i++;
        tmp = seq[i];
        seq[i] = seq[j];
        seq[j] = tmp;
      }
    }
    tmp = seq[i + 1];
    seq[i + 1] = seq[end];
    seq[end] = tmp;
    return i + 1;
  };

  var quicksort = function (seq, start, end) {
    if (start < end) {
      pivot = partition(seq, start, end);
      quicksort(seq, start, pivot - 1);
      quicksort(seq, pivot + 1, end);
    }
  };

  quicksort(seq, 0, seq.length - 1);
};

var is_sorted = function (seq) {
  if (seq.length < 1) return true;
  for (var i = 1; i < seq.length; i++) {
    if (seq[i - 1] > seq[i]) return false;
  }
  return true;
};

var is_sorted_until = function (seq) {
  if (seq.length < 1) return seq.length;
  for (var i = 1; i < seq.length; i++) {
    if (seq[i - 1] > seq[i]) return i;
  }
  return seq.length;
};

var partial_sort = function (seq, border) {
  var partition = [];
  Heap.make_heap(seq);
  for (var i = 0; i < border; i++) {
    partition.push(Heap.pop_heap(seq));
  }
  while (partition.length > 0) {
    Array.prototype.unshift.call(seq, partition.pop());
  }
};

var partial_sort_copy = function (seq, border) {
  var partition = [];
  var heap = Array.prototype.slice.call(seq);
  Heap.make_heap(heap);
  for (var i = 0; i < border; i++) {
    partition.push(Heap.pop_heap(heap));
  }
  return partition;
};

var stable_sort = function (seq, func) {
  Heap.sort_heap(seq, func);
};

// Heap.make_heap will construct a min-heap, so we use it to
// find the nlargest element, which n is one-base.
var nth_element = function (seq, n) {
  var heap = Array.prototype.slice.call(seq, 0, n);
  Heap.make_heap(heap);
  for (var i = n; i < seq.length; i++) {
    if (seq[i] > heap[0]) {
      Heap.pop_heap(heap);
      Heap.push_heap(heap, seq[i]);
    }
  }
  return Heap.pop_heap(heap);
};

module.exports = {
  is_sorted: is_sorted,
  is_sorted_until: is_sorted_until,
  sort: sort,
  partial_sort: partial_sort,
  partial_sort_copy: partial_sort_copy,
  stable_sort: stable_sort,
  nth_element: nth_element
};
