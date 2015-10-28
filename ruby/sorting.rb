# Implementations of sorting algorithms.

require_relative 'heap'

module Sorting
include Heap

def is_sorted(seq)
  (0...(seq.size-1)).each{|i| return false if seq[i+1] < seq[i]}
  true
end

def is_sorted_until(seq)
  (0...(seq.size-1)).each{|i| return i+1 if seq[i+1] < seq[i]}
  seq.size
end

def sort(seq)
  def quick_sort(seq, start, stop)
    return if start >= stop
    i = start - 1
    (start...stop).each do |j|
      if seq[j] <= seq[stop]
        i += 1
        seq[i], seq[j] = seq[j], seq[i]
      end
    end
    seq[i+1], seq[stop] = seq[stop], seq[i+1]
    quick_sort(seq, start, i)
    quick_sort(seq, i + 2, stop)
  end

  quick_sort(seq, 0, seq.size-1)
end

def partial_sort(seq, border)
  make_heap seq
  Array.new(border){pop_heap(seq)}.reverse_each{|v| seq.unshift(v)}
end

def partial_sort_copy(seq, border)
  make_heap seq
  Array.new(border){pop_heap(seq)}
end

# use insert sort to make it stable
# accept a block as less comparator
def stable_sort(seq)
  (1...seq.size).each do |i|
    j = i
    while j > 0 && (yield seq[j], seq[j-1])
      seq[j-1], seq[j] = seq[j], seq[j-1]
      j -= 1
    end
  end
end

def nth_element(seq, nth)
  def quick_select(seq, left, right, border)
    return if left >= right
    i = left - 1
    (left...right).each do |j|
      if seq[j] <= seq[right]
        i += 1
        seq[i], seq[j] = seq[j], seq[i]
      end
    end
    seq[i+1], seq[right] = seq[right], seq[i+1]
    if i + 1 < border
      quick_select(seq, i+2, right, border)
    elsif i + 1 > border
      quick_select(seq, left, i, border)
    end
  end

  quick_select(seq, 0, seq.size-1, nth)
  seq[nth]
end

end
