require 'minitest/autorun'
require_relative 'numeric'

class TestNumeric < MiniTest::Test
  include NumericAlgorithm

  def setup
    @a = [1, 2, 3]
  end

  def test_itoa
    y = itoa(1)
    assert_equal 1, y.next
    assert_equal 2, y.next
  end

  def test_accumulate
    assert_equal 6, accumulate(@a, 1){|x, y| x * y}
  end

  def test_inner_product
    assert_equal 14, inner_product(@a, @a, 0)
  end

  def test_adjacent_difference
    assert_equal [1, 1, 1], adjacent_difference(@a)
  end

  def test_partial_sum
    assert_equal [1, 3, 6], partial_sum(@a)
  end
end
