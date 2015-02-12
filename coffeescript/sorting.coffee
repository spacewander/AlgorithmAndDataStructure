Heap = require './heap'

sort = (seq) ->
  parition = (seq, start, end) ->
    x= seq[end]
    i = start - 1
    for j in [start...end]
      if seq[j] <= x
        i += 1
        [seq[i], seq[j]] = [seq[j], seq[i]]
    [seq[i + 1], seq[end]] = [seq[end], seq[i + 1]]
    return i + 1

  quicksort = (seq, start, end) ->
    if start < end
      pivot = parition(seq, start, end)
      quicksort(seq, start, pivot - 1)
      quicksort(seq, pivot + 1, end)

  quicksort(seq, 0, seq.length - 1)

# ascending order
is_sorted = (seq) ->
  return true if seq.length < 1
  for i in [0...(seq.length - 1)]
    return false if seq[i] > seq[i + 1]
  return true

# return an index of the first unordered element
is_sorted_until = (seq) ->
  return seq.length if seq.length < 1
  for i in [0...(seq.length - 1)]
    return i + 1 if seq[i] > seq[i + 1]
  return seq.length

partial_sort = (seq, border) ->
  Heap.make_heap seq
  partition = (Heap.pop_heap(seq) for i in [0...border])
  while partition.length > 0
    Array.prototype.unshift.call(seq, partition.pop())
    
partial_sort_copy = (seq, border) ->
  heap = Array.prototype.slice.call(seq)
  Heap.make_heap heap
  return (Heap.pop_heap(heap) for i in [0...border])

stable_sort = (seq, func) ->
  return if seq.length < 1
  size = seq.length - 1
  for i in [0...size]
    min = i
    for j in [i+1...seq.length]
      min = j if func(seq[j], seq[min])
    min_element = Array.prototype.splice.call(seq, min, 1)[0]
    Array.prototype.splice.call(seq, i, 0, min_element)

# find the nth largest element, n starts from 1
nth_element = (seq, n) ->
  heap = Array.prototype.slice.call(seq, 0, n)
  Heap.make_heap heap
  for i in [n...seq.length]
    if seq[i] > heap[0]
      Heap.pop_heap heap
      Heap.push_heap(heap, seq[i])
  return Heap.pop_heap heap

module.exports =
  sort: sort
  is_sorted: is_sorted
  is_sorted_until: is_sorted_until
  partial_sort: partial_sort
  partial_sort_copy: partial_sort_copy
  stable_sort: stable_sort
  nth_element: nth_element
