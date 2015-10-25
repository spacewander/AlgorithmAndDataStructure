# Implementations of modifying sequence algorithms
module ModifyingSequence

def copy(iterable, start, stop)
  iterable.drop(start).take(stop - start)
end

def copy_if(iterable, &block)
  iterable.select(&block)
end

def copy_n(iterable, count)
  iterable.take(count)
end

def copy_backward(iterable, start, stop)
  copy(iterable, start, stop).reverse_each.to_a
end

alias_method :move, :copy
alias_method :move_backward, :copy_backward

def fill(seq, value)
  seq.each_index{|i| seq[i] = value}
end

def fill_n(seq, value, count)
  min = (count < seq.size ? count : seq.size)
  (0...min).each{|i| seq[i] = value}
end

def transform(iterable, &block)
  iterable.map(&block)
end

def generate(seq)
  seq.each_index{|i| seq[i] = yield }
end

def generate_n(seq, count)
  min = (count < seq.size ? count : seq.size)
  (0...min).each{|i| seq[i] = yield}
  seq
end

def remove(iterable, match)
  iterable.reject{|x| x == match}
end

def remove_if(iterable, &block)
  iterable.reject(&block)
end

# implement remove_copy as remove
alias_method :remove_copy, :remove

# implement remove_copy_if as remove_if
alias_method :remove_copy_if, :remove_if

def replace(iterable, before, after)
  iterable.map{|x| x == before ? after : x}
end

def replace_if(iterable, after)
  iterable.map{|x| (yield x) ? after : x}
end

# implement replace_copy as replace
alias_method :replace_copy, :replace

# implement replace_copy_if as replace_if
alias_method :replace_copy_if, :replace_if

def swap(a, b)
  return b, a
end

# implement iter_swap as swap
alias_method :iter_swap, :swap

def swap_range(a, b, start, stop)
  max_size = (a.size > b.size ? a.size : b.size)
  return if start < 0 || start >= stop || stop > max_size
  (start...stop).each{|i| a[i], b[i] = b[i], a[i]}
end

def reverse_in_place(seq, start, stop)
  (start..((start+stop)/2).to_i).each{
    |i| seq[i], seq[start+stop-i] = seq[start+stop-i], seq[i]
  }
end

def reverse(seq)
  stop = seq.size - 1
  reverse_in_place(seq, 0, stop)
end

# implement reverse_copy as reverse
alias_method :reverse_copy, :reverse

def rotate(seq, pivot)
  reverse_in_place(seq, 0, pivot-1)
  reverse_in_place(seq, pivot, seq.length-1)
  reverse_in_place(seq, 0, seq.length-1)
  seq
end

def rotate_copy(seq, pivot)
  seq[pivot...seq.length] + seq[0...pivot]
end

def shuffle(seq)
  srand Time.now.to_i
  (0...seq.length).each do |i|
    random = rand(i)
    seq[i], seq[random] = seq[random], seq[i]
  end
end

def unique(seq)
  return if seq.length <= 1
  current = seq[0]
  seq[1...seq.length].reject do |x|
    same = (x == current)
    current = x unless same
    same
  end.unshift(seq[0])
end

# implement unique_copy as unique
alias_method :unique_copy, :unique

end
