max = (a, b) ->
  if a > b then a else b

min = (a, b) ->
  if a > b then b else a

minmax = (a, b) ->
  if a > b then {min: b, max: a} else {min: a, max: b}

max_element = (seq) ->
  Array.prototype.reduce.call(seq, max)

min_element = (seq) ->
  Array.prototype.reduce.call(seq, min)

minmax_element = (seq) ->
  max_element: max_element seq
  min_element: min_element seq

lexicographical_compare = (seq1, seq2) ->
  return false if seq2.length < seq1.length
  for i in [0...seq1.length]
    if seq1[i] < seq2[i]
      return true
    else if seq2[i] < seq1[i]
      return false
  return true

is_permutation = (seq1, seq2) ->
  return false if seq1.length != seq2.length
  elements = {}
  Array.prototype.forEach.call seq1, (e) ->
    if elements[e]
      elements[e] += 1
    else
      elements[e] = 1
  for i in [0...seq2.length]
    if elements[seq2[i]] and elements[seq2[i]] != 0
      elements[seq2[i]] -= 1
    else
      return false
  return true

next_permutation = (seq) ->
  return false if seq.length <= 1
  i = seq.length - 1
  while true
    pos1 = i
    i -= 1
    if seq[i] < seq[pos1]
      pos2 = seq.length - 1
      while seq[i] >= seq[pos2]
        pos2 -= 1
      [seq[i], seq[pos2]] = [seq[pos2], seq[i]]
      pivot = (seq.length - pos1) / 2
      for j in [0...pivot]
        [seq[seq.length - j - 1], seq[pos1 + j]] = \
          [seq[pos1 + j], seq[seq.length - j - 1]]
      return true
    if i == 0
      Array.prototype.reverse.call ary
      return false

prev_permutation = (seq) ->
  return false if seq.length <= 1
  i = seq.length - 1
  while true
    pos1 = i
    i -= 1
    if seq[pos1] < seq[i]
      pos2 = seq.length - 1
      while seq[pos2] >= seq[i]
        pos2 -= 1
      [seq[i], seq[pos2]] = [seq[pos2], seq[i]]
      pivot = (seq.length - pos1) / 2
      for j in [0...pivot]
        [seq[seq.length - j - 1], seq[pos1 + j]] = \
          [seq[pos1 + j], seq[seq.length - j - 1]]
      return true
    if i == 0
      Array.prototype.reverse.call ary
      return false

module.exports = {
  min,
  max,
  minmax,
  min_element,
  max_element,
  minmax_element,
  lexicographical_compare,
  is_permutation,
  next_permutation,
  prev_permutation
}
