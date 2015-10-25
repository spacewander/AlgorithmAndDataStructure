# Implementation of min/max algorithms
require_relative 'modifying_sequence'

module MinMax

include ModifyingSequence

def max(a, b)
  a > b ? a : b
end

def min(a, b)
  a < b ? a : b
end

def max_element(seq)
  seq.reduce{|a, b| a > b ? a : b}
end

def min_element(seq)
  seq.reduce{|a, b| a < b ? a : b}
end

def minmax(a, b)
  a > b ? [b, a] : [a, b]
end

def minmax_element(seq)
  [min_element(seq), max_element(seq)]
end

# return 1 => seq1 > seq2
# return 0 => seq1 == seq2
# return -1 => seq1 < seq2
def lexicographical_compare(seq1, seq2)
  min = min(seq1.length, seq2.length)
  (0...min).each do |i|
    return -1 if seq1[i] < seq2[i]
    return 1 if seq1[i] > seq2[i]
  end
  return (seq2.length == min) ? 0 : -1 if seq1.length == min
  1
end

def is_permutation(seq1, seq2)
  ch_in_seq1 = {}
  seq1.each do |c|
    ch_in_seq1[c] = 0 unless ch_in_seq1.include?(c)
    ch_in_seq1[c] += 1
  end
  seq2.each do |c|
    return false unless ch_in_seq1.include?(c)
    ch_in_seq1[c] -= 1
  end
  ch_in_seq1.keep_if{|k, v| v != 0}.empty?
end

def next_permutation(seq)
  return false if seq.length <= 1
  i = seq.length - 1
  while true
    j = i
    i -= 1
    if seq[i] < seq[j]
      k = seq.length - 1
      k -= 1 while seq[i] >= seq[k]
      seq[i], seq[k] = seq[k], seq[i]
      reverse_in_place(seq, j, seq.length-1)
      return true
    end
    if i == 0
      reverse_in_place(seq, 0, seq.length-1)
      return false
    end
  end
end

def prev_permutation(seq)
  return false if seq.length <= 1
  i = seq.length - 1
  while true
    j = i
    i -= 1
    if seq[j] < seq[i]
      k = seq.length - 1
      k -= 1 while seq[i] <= seq[k]
      seq[i], seq[k] = seq[k], seq[i]
      reverse_in_place(seq, j, seq.length-1)
      return true
    end
    if i == 0
      reverse_in_place(seq, 0, seq.length-1)
      return false
    end
  end
end

end
