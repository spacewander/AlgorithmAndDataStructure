var all_of = function(ary, cb) {
  var ok = true;
  if (Array.isArray(ary))
  for (var i = 0; i < ary.length; i++) {
    ok = cb(ary[i]);
    if (!ok) break;
  }
  return ok;
};

var any_of = function(ary, cb) {
  var ok = true;
  for (var i = 0; i < ary.length; i++) {
    ok = cb(ary[i]);
    if (ok) break;
  }
  return ok;
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

module.exports = {
  all_of: all_of,
  any_of: any_of,
  none_of: none_of,
  for_each: for_each,
  count: count,
  count_if: count_if,
  mismatch: mismatch
};
