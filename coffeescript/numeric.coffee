reduce = Array.prototype.reduce

itoa = (v) ->
  value = v
  return ->
    value++

accumulate = (seq, init, func) ->
  reduce.call seq, func, init

inner_production = (seq1, seq2, init) ->
  reduce.call seq1, (prev, cur, idx) ->
    prev + cur * seq2[idx]
  , init

adjacent_difference = (seq) ->
  if seq.length == 0
    return []
  [seq[0]].concat(seq[i] - seq[i - 1] for i in [1...seq.length])

partial_sum = (seq) ->
  if seq.length == 0
    return []
  sum = seq[0]
  [seq[0]].concat(sum += seq[i] for i in [1...seq.length])

module.exports = {
  itoa,
  accumulate,
  inner_production,
  adjacent_difference,
  partial_sum
}
