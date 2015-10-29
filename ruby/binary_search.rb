# Implementations of binary search algorithms.
# Require all sequence is sorted

module BinarySearch

def lower_bound(seq, value)
  count = seq.size
  start = 0
  while count > 0
    i = start
    step = (count / 2).to_i
    i += step
    if seq[i] < value
      start = i + 1
      count -= step + 1
    else
      count = step
    end
  end
  start
end

def upper_bound(seq, value)
  count = seq.size
  start = 0
  while count > 0
    i = start
    step = (count / 2).to_i
    i += step
    if seq[i] <= value
      start = i + 1
      count -= step + 1
    else
      count = step
    end
  end
  start
end

def binary_search(seq, value)
  idx = lower_bound(seq, value)
  idx != seq.size && seq[idx] == value
end

def equal_range(seq, value)
  [lower_bound(seq, value), upper_bound(seq, value)]
end

end
