# Implementations of non-modifying sequence algorithms

def all_of(iterable)
  iterable.all?{|value| yield value}
end

def any_of(iterable)
  iterable.any?{|value| yield value}
end

def none_of(iterable)
  iterable.none?{|value| yield value}
end

def for_each(iterable)
  iterable.each{|value| yield value}
end

def count(iterable, match)
  iterable.count match
end

def count_if(iterable)
  iterable.count{|value| yield value}
end

def mismatch(iter1, iter2)
  min, max = [iter1, iter2].minmax
  zipped = (0..min.length).zip(min).zip((0..max.length).zip(max))
  zipped.each_with_index do |ary|
    if block_given?
      return ary[0][0], ary[1][0] unless yield ary[0][1], ary[1][1]
    else
      return ary[0][0], ary[1][0] unless ary[0][1] == ary[1][1]
    end
  end
  [nil, nil]
end

def equal(iter1, iter2)
  zipped = iter1.zip(iter2).drop_while{|ary| ary.include?(nil)}
  if block_given?
    zipped.all?{|ary| yield ary[0], ary[1]}
  else
    zipped.all?{|ary| ary[0] == ary[1]}
  end
end

def find(iterable, match)
  iterable.each_with_index{|v, i| return i if v == match}
  nil
end

def find_if(iterable)
  iterable.each_with_index{|v, i| return i if yield v}
  nil
end

def find_if_not(iterable)
  iterable.each_with_index{|v, i| return i unless yield v}
  nil
end

def find_end(iter1, iter2, &func)
  func = Proc.new{|x, y| x == y} unless block_given?
  return nil if iter2.size == 0 || iter1.size < iter2.size
  idx = nil
  (0..(iter1.size - iter2.size)).each do |i|
    j = i
    iter2.each do |v|
      break if !func.call(iter1[j], v)
      j += 1
    end
    idx = i if j == (i + iter2.size)
  end
  idx
end

def find_first_of(iter1, iter2, &func)
  func = Proc.new{|x, y| x == y} unless block_given?
  iter1.each_index do |i|
    iter2.each{|v| return i if func.call(iter1[i], v)}
  end
  nil
end
