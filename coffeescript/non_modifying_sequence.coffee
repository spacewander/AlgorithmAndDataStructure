all_of = (ary, cb) ->
  for i in ary
    return false if !cb(i)
  return true

any_of = (ary, cb) ->
  for i in ary
    return true if cb(i)
  return false

none_of = (ary, cb) ->
  not Array.prototype.some.call ary, cb

for_each = (coll, cb) ->
  if coll.hasOwnProperty 'length'
    cb i for i in coll
  else
    cb i for _, i of coll

count_if = (coll, cb) ->
  counter = 0
  if coll.hasOwnProperty 'length'
    counter += 1 for i in coll when cb(i)
  else
    counter += 1 for _, i of coll when cb(i)
  counter

count = (coll, match) ->
  count_if coll, (e) ->
    e == match

mismatch = (a, b) ->
  for i in [0...a.length]
    return i if a[i] != b[i]

equal = (a, b) ->
  JSON.stringify(a) == JSON.stringify(b)

find_if = (coll, cb) ->
  for i, _ of coll
    return i if cb(coll[i])

find_if_not = (coll, cb) ->
  for i, _ of coll
    return i unless cb(coll[i])

find = (coll, match) ->
  find_if coll, (e) ->
    e == match

find_end = (ary, sub) ->
  eq = (a, b) -> a == b
  meet = search ary, sub, eq
  lastMet = -1
  while meet != -1
    lastMet += (meet + 1)
    ary = Array.prototype.slice.call(ary, meet + 1)
    meet = search ary, sub, eq
  lastMet

find_first_of = (ary, sub) ->
  meet = -1
  for i in sub
    meet = Array.prototype.indexOf.call ary, i
    return meet if meet != -1
  meet

search = (ary, sub, cb) ->
  return 0 if sub.length == 0
  start = Array.prototype.indexOf.call ary, sub[0]
  mismatch = false
  while start != -1
    for i in [0...sub.length]
      if not cb(ary[start + i], sub[i])
        mismatch = true
        break
    return start unless mismatch
    start = Array.prototype.indexOf.call ary, sub[0], start + 1
  return -1

search_n = (ary, n, value, cb) ->
  sub = (value for i in [0...n])
  search ary, sub, cb


module.exports = {
  all_of,
  any_of,
  none_of,
  for_each,
  count_if,
  count,
  mismatch,
  equal,
  find_if,
  find_if_not,
  find,
  find_end,
  find_first_of,
  search,
  search_n
}
