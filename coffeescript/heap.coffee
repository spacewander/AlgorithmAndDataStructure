is_heap = (seq) ->
  return true if seq.length is 0
  for i in [1...seq.length]
    return false if seq[i] < seq[Math.floor((i - 1) / 2)]
  return true

is_heap_until = (seq) ->
  return 0 if seq.length is 0
  for i in [1...seq.length]
    return i if seq[i] < seq[Math.floor((i - 1) / 2)]
  return seq.length

make_heap = (seq, func) ->
  if func is undefined
    func = (a, b) ->
      a < b
  for i in [(Math.floor(seq.length / 2) - 1)..0]
    while true
      left = 2 * i + 1
      break if left >= seq.length
      smallest = if func(seq[left], seq[i]) then left else i
      right = left + 1
      if right < seq.length and func(seq[right], seq[smallest])
        smallest = right
      if seq[smallest] != seq[i]
        [seq[smallest], seq[i]] = [seq[i], seq[smallest]]
        i = smallest
      else
        break

pop_heap = (seq) ->
  tmp = Array.prototype.shift.call seq
  make_heap seq
  tmp

push_heap = (seq, value) ->
  Array.prototype.push.call(seq, value)
  make_heap seq

sort_heap = (seq, func) ->
  size = seq.length
  make_heap(seq, func)
  res = (pop_heap(seq) for i in [0...size])
  Array.prototype.push.call(seq, res[j]) for j in [0...res.length]

module.exports = {
  is_heap,
  is_heap_until,
  make_heap,
  pop_heap,
  push_heap,
  sort_heap
}
