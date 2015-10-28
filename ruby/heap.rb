# Implementation of heap algorithms

module Heap

def is_heap(seq)
  (1...seq.size).each{|i| return false if seq[i] < seq[((i-1)/2).to_i]}
  true
end

def is_heap_until(seq)
  (1...seq.size).each{|i| return i if seq[i] < seq[((i-1)/2).to_i]}
  seq.size
end

def push_heap(seq, value)
  seq.push value
  make_heap seq
end

def pop_heap(seq)
  res = seq.shift
  make_heap seq
  res
end

def sort_heap(seq)
  make_heap seq
  Array.new(seq.size){pop_heap(seq)}
end

# make a min heap
def make_heap(seq)
  (0...(seq.size/2).to_i).reverse_each do |i|
    loop do
      left = 2 * i + 1
      break if left >= seq.size
      smallest = (seq[left] < seq[i]) ? left : i
      right = left + 1
      smallest = right if right < seq.size && seq[right] < seq[smallest]
      break if seq[smallest] == seq[i]
      seq[i], seq[smallest] = seq[smallest], seq[i]
      i = smallest
    end
  end
end

end
