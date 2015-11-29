lower_bound = (seq, value) ->
  count = seq.length
  start = 0
  while count > 0
    i = start
    step = Math.floor(count / 2)
    i += step
    if seq[i] < value
      start = i + 1
      count -= step + 1
    else
      count = step
  return start

upper_bound = (seq, value) ->
  count = seq.length
  start = 0
  while count > 0
    i = start
    step = Math.floor(count / 2)
    i += step
    if seq[i] <= value
      start = i + 1
      count -= step + 1
    else
      count = step
  return start

binary_search = (seq, value) ->
  i = lower_bound(seq, value)
  return i != seq.length and seq[i] == value

equal_range  = (seq, value) ->
  lower_bound: lower_bound(seq, value)
  upper_bound: upper_bound(seq, value)

module.exports = {
  lower_bound,
  upper_bound,
  binary_search,
  equal_range
}
