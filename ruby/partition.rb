# Implementations of partition algorithms
module Partition

def is_partitioned(iterable)
  pass_parition_point = false
  iterable.each do |v|
    unless pass_parition_point
      pass_parition_point = true unless yield v
    else
      return false if yield v
    end
  end
  true
end

def partition_point(iterable)
  iterable.each_with_index{|v, i| return i unless yield v}
end

def partition(seq, &block)
  pivot = partition_point(seq, &block)
  (pivot...seq.size).each do |i|
    if yield seq[i]
      seq[pivot], seq[i] = seq[i], seq[pivot]
      pivot += 1
    end
  end
end

def partition_copy(seq)
  true_part, false_part = [], []
  seq.each do |v|
    if yield v
      true_part.push v
    else
      false_part.push v
    end
  end
  true_part + false_part
end

def stable_partition(seq)
  count = seq.size
  seq.each do |i|
    unless yield i
      seq.delete i
      seq.push i
    end
    count -= 1
    return if count == 0
  end
end

end
