var all_of = function(ary, cb) {
  for (var i = 0; i < ary.length; i++) {
    if (!cb(ary[i])) return false;
  }
  return true;
};

var any_of = function(ary, cb) {
  for (var i = 0; i < ary.length; i++) {
    if (cb(ary[i])) return true;
  }
  return false;
};

var none_of = function(ary, cb) {
  return !Array.prototype.some.call(ary, cb);
};

var for_each = function(collection, cb) {
  if (collection.hasOwnProperty('length')) {
    for (var i = 0; i < collection.length; i++) {
      cb(collection[i]);
    }
  }
  else {
    for (var j in collection) {
      cb(collection[j]);
    }
  }
};

var count_if = function(collection, cb) {
  var count = 0;
  if (collection.hasOwnProperty('length')) {
    Array.prototype.forEach.call(collection, function(e){
      if (cb(e)) 
        count += 1;
    });
  }
  else {
    for (var i in collection) {
      if (cb(collection[i]))
        count += 1;
    }
  }
  return count;
};

var count = function(collection, match) {
  return count_if(collection, function(e){
    return e === match;
  });
};

var mismatch = function(ary1, ary2) {
  for (var i = 0; i < ary1.length; i++) {
    if (ary1[i] !== ary2[i]) {
      return i;
    }
  }
};

var equal = function(collection1, collection2) {
  return JSON.stringify(collection1) === JSON.stringify(collection2);
};

// Only consider that collection isn't an Array
var find_if = function(collection, cb) {
  for (var i in collection) {
    if (cb(collection[i])) {
      return i;
    }
  }
};

var find_if_not = function(collection, cb) {
  for (var i in collection) {
    if (!cb(collection[i])) {
      return i;
    }
  }
};

var find = function(collection, match) {
  return find_if(collection, function(e){
    return e === match;
  });
};

var find_end = function(ary, sub) {
  var eq = function(a, b) { return a === b; };
  var meet = search(ary, sub, eq);
  var lastMet = -1;
  while (meet != -1) {
    lastMet += (meet + 1);
    ary = Array.prototype.slice.call(ary, meet + 1);
    meet = search(ary, sub, eq);
  }
  return lastMet;
};

var find_first_of = function(ary, sub) {
  var meet = -1;
  for (var i = 0; i < sub.length; i++) {
    if ((meet = Array.prototype.indexOf.call(ary, sub[i])) != -1) {
      return meet;
    }
  }
  return meet;
};

var search = function(ary, sub, cb) {
  if (sub.length === 0)
    return 0;
  var start = Array.prototype.indexOf.call(ary, sub[0]);
  var mismatch = false;
  while (start != -1) {
    for (var i = 0; i < sub.length; i++) {
      if (!cb(ary[start + i], sub[i])) {
        mismatch = true;
        break;
      }
    }
    if (!mismatch) {
      return start;
    }
    else {
      start = Array.prototype.indexOf.call(ary, sub[0], start + 1);
    }
  }
  return -1;
};

var search_n = function(ary, n, value, cb) {
  var sub = new Array(n);
  for (var i = 0; i < sub.length; i++) {
    sub[i] = value;
  }
  return search(ary, sub, cb);
};

module.exports = {
  all_of: all_of,
  any_of: any_of,
  none_of: none_of,
  for_each: for_each,
  count: count,
  count_if: count_if,
  mismatch: mismatch,
  equal: equal,
  find: find,
  find_if: find_if,
  find_if_not: find_if_not,
  find_end: find_end,
  find_first_of: find_first_of,
  search: search,
  search_n: search_n
};
