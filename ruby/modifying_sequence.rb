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
  (0...([count, seq.size].min)).each{|i| seq[i] = value}
end

def transform(iterable, &block)
  iterable.map(&block)
end

def generate(seq)
  seq.each_index{|i| seq[i] = yield }
end

def generate_n(seq, count)
  (0...([count, seq.size].min)).each{|i| seq[i] = yield}
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

end
