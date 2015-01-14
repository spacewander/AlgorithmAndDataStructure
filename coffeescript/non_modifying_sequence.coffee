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
  return count_if coll, (e) ->
    e == match

module.exports =
  all_of : all_of
  any_of : any_of
  none_of : none_of
  for_each : for_each
  count_if : count_if
  count : count
