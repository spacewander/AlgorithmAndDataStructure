# Implementations of set algorithms.
module SetAlgorithm

# Both merge and inplace_merge require seq1 and seq2 are sorted.
# And result they returned is sorted too.
def merge(seq1, seq2)
  res = []
  i = j = 0
  while i < seq1.size && j < seq2.size
    if seq1[i] > seq2[j]
      res.push seq2[j]
      j += 1
    elsif seq1[i] == seq2[j]
      res.push seq1[i]
      i += 1
      j += 1
    else
      res.push seq1[i]
      i += 1
    end
  end
  if i == seq1.size
    res + seq2[j...seq2.size]
  else
    res + seq1[i...seq1.size]
  end
end

def inplace_merge(seq1, seq2)
  j = 0
  seq1.each do |v, i|
    while v >= seq2[j] && j < seq2.size
      seq1.insert(i, seq2[j]) if v > seq2[j]
      j += 1
    end
  end
  seq1 + seq2[j...seq2.size]
end

def includes(seq1, seq2)
  seq2.each{|v| return false unless seq1.include?(v)}
  true
end

def union(seq1, seq2)
  seq1.reject{|v| seq2.include?(v)} + seq2
end

def difference(seq1, seq2)
  seq1.reject{|v| seq2.include?(v)}
end

def symmetric_difference(seq1, seq2)
  difference(seq1, seq2) + difference(seq2, seq1)
end

def intersection(seq1, seq2)
  seq1.select{|v| seq2.include?(v)}
end

end
