var is_partitioned = function(seq, func) {
  for (var i = 0; i < seq.length; i++) {
    if (!func(seq[i])) {
      break;
    }
  }
  for (; i < seq.length; i++)
    if (func(seq[i])) return false;
  return true;
};

var partition_point = function(seq, func) {
  for (var i = 0; i < seq.length; i++)
    if (!func(seq[i])) return i;
  return i;
};

var partition = function(seq, func) {
  pivot = partition_point(seq, func);
  var tmp;
  for (var i = pivot; i < seq.length; i++) {
    if (func(seq[i])) {
      tmp = seq[pivot];
      seq[pivot] = seq[i];
      seq[i] = tmp;
      pivot += 1;
    }
  }
};

var partition_copy = function(seq, func) {
  res = [];
  var len = seq.length;
  for (var i = 0; i < len; i++) {
    if (func(seq[i])) {
      res.unshift(seq[i]);
    }
    else {
      res.push(seq[i]);
    }
  }
  return res;
};

var stable_partition = function(seq, func) {
  var len = seq.length;
  var tmp;
  for (var i = 0; i < len; i++) {
    if (!func(seq[i])) {
      tmp = Array.prototype.splice.call(seq, i, 1);
      Array.prototype.push.call(seq, tmp[0]);
    }
  }
};

module.exports = {
  is_partitioned: is_partitioned,
  partition_point: partition_point,
  partition: partition,
  partition_copy: partition_copy,
  stable_partition: stable_partition
};
