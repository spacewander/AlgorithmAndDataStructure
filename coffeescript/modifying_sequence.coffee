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
