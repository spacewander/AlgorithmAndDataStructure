NonModifyingSequence = require './non_modifying_sequence'

# only implement the Object version
copy = (src, dest) ->
  dest[i] = src[i] for i of src when dest[i] is undefined

copy_if = (src, dest, cb) ->
  dest[i] = src[i] for i of src when dest[i] is undefined and cb src[i]

copy_n = (dest, n, value) ->
  dest[i] = value for i in [0...n]

copy_backward = (src, dest) ->
  gap = src.length - dest.length
  return -1 if gap < 0
  src[i + gap] = dest[i] for i in [0...dest.length]
  gap

move = (src, dest) ->
  dest[i] = src[i] for i of src when dest[i] is undefined

move_backward = (src, dest) ->
  gap = src.length - dest.length
  return -1 if gap < 0
  src[i + gap] = dest[i] for i in [0...dest.length]
  gap

fill = (ary, value) ->
  ary[i] = value for i in [0...ary.length]

fill_n = (ary, n, value) ->
  ary[i] = value for i in [0...n]

transform = (coll, cb) ->
  NonModifyingSequence.for_each coll, cb
  coll

generate = (ary, g) ->
  ary[i] = g() for i in [0...ary.length]

generate_n = (ary, n, g) ->
  ary[i] = g() for i in [0...n]

remove_if = (coll, cb) ->
  if coll.hasOwnProperty 'length'
    copy = coll.constructor()
    j = 0
    copy[j++] = i for i in coll when not cb i
    while i-- > j
      Array.prototype.shift.call coll
    coll[i] = copy[i] for i in [0...j]
  else
    delete coll[k] for k, v of coll when coll.hasOwnProperty(k) and cb(v)
    
remove = (ary, value) ->
  remove_if ary, (e) ->
    e == value

remove_copy_if = (coll, cb) ->
  copy = coll.constructor()
  if coll.hasOwnProperty 'length'
    j = 0
    copy[j++] = i for i in coll when cb i
  else
    copy[k] = coll[k] for k, v of coll when coll.hasOwnProperty(k) and cb(v)
  return copy

remove_copy = (ary, value) ->
  remove_copy_if ary, (e) ->
    e == value
    
replace_if = (coll, cb, after) ->
  if coll.hasOwnProperty 'length'
    coll[i] = after for i in [0...coll.length] when cb coll[i]
  else
    coll[k] = after for k, v of coll when coll.hasOwnProperty(k) and cb(v)

replace = (coll, before, after) ->
  replace_if coll, (e) ->
    e == before
  , after

replace_copy_if = (coll, cb, after) ->
  copy = coll.constructor()
  if coll.hasOwnProperty 'length'
    for i in [0...coll.length]
      copy[i] = if cb coll[i] then after else coll[i]
  else
    for j of coll
      if coll.hasOwnProperty(j) and cb coll[j]
        copy[j] = after
      else
        copy[j] = coll[j]
  return copy

replace_copy = (coll, before, after) ->
  replace_copy_if coll, (e) ->
    e == before
  , after

module.exports =
  copy: copy
  copy_if: copy_if
  copy_n: copy_n
  copy_backward: copy_backward
  move: move
  move_backward: move_backward
  fill: fill
  fill_n: fill_n
  transform: transform
  generate: generate
  generate_n: generate_n
  remove: remove
  remove_if: remove_if
  remove_copy: remove_copy
  remove_copy_if: remove_copy_if
  replace: replace
  replace_if: replace_if
  replace_copy: replace_copy
  replace_copy_if: replace_copy_if
