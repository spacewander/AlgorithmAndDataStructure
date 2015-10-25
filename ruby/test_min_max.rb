require 'minitest/autorun'
require_relative 'min_max'

class TestMinMax < MiniTest::Test
  include MinMax

  def setup
    @ary = [2, 3, 1, 4, 5]
  end

  def test_min
    assert_equal 2, min(2, 3)
  end

  def test_max
    assert_equal 3, max(2, 3)
  end

  def test_max_element
    assert_equal 5, max_element(@ary)
  end

  def test_min_element
    assert_equal 1, min_element(@ary)
  end

  def test_minmax
    min_value, max_value = minmax(2, 3)
    assert_equal 2, min_value
    assert_equal 3, max_value
  end

  def test_lexicographical_compare
    a = 'abcd'
    b = 'abce'
    assert_equal(-1, lexicographical_compare(a, b))
    c = 'abcde'
    assert_equal 1, lexicographical_compare(c, a)
    assert_equal(-1, lexicographical_compare(a, c))

    assert_equal 0, lexicographical_compare(a, a)
  end

  def test_is_permutation
    assert_equal true, is_permutation(@ary, [1, 2, 3, 4, 5])
    assert_equal false, is_permutation(@ary, [1, 2, 3, 3, 4, 5])
    assert_equal false, is_permutation(@ary, [1, 4, 5])
  end

  def test_next_permutation
    assert_equal true, next_permutation(@ary)
    assert_equal [2, 3, 1, 5, 4], @ary
  end

  def test_prev_permutation
    old_ary = Array.new(@ary)
    prev_permutation(@ary)
    next_permutation(@ary)
    assert_equal old_ary, @ary
  end
end

