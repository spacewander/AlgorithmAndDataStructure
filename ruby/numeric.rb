# Implementation of numeric algorithms

module NumericAlgorithm

def itoa(v)
  Enumerator.new do |yielder|
    value = v
    loop do
      yielder << value
      value += 1
    end
  end
end

def accumulate(seq, init, &block)
  seq.reduce(init, &block)
end

def inner_product(seq1, seq2, init)
  raise ArgumentError.new('second sequence should be as long as the first one'
                         ) if seq1.size != seq2.size
  seq1.zip(seq2).reduce(init){|x, y| x + y[0] * y[1]}
end

def adjacent_difference(seq)
  res = seq[0...seq.size-1].unshift(0)
  seq.each_with_index{|v, i| res[i] = v - res[i]}
  res
end

def partial_sum(seq)
  res = seq[0...seq.size-1].unshift(seq[0])
  seq.each_with_index{|v, i| res[i] = res[i-1] + v if i >= 1}
  res
end

end
