require 'minitest/autorun'
require_relative 'binary_search'

class TestBinarySearch < MiniTest::Test
  include BinarySearch

  def setup
    @a = [1, 2, 3, 4]
  end

  def test_lower_bound
    assert_equal 3, @a[lower_bound(@a, 3)]
    assert_equal 3, @a[lower_bound(@a, 2.5)]
    assert_equal 1, @a[lower_bound(@a, 1)]
    assert_equal @a.size, lower_bound(@a, 5)
  end

  def test_upper_bound
    assert_equal @a.size, upper_bound(@a, 4)
    assert_equal 3, @a[upper_bound(@a, 2.5)]
    assert_equal 4, @a[upper_bound(@a, 3)]
  end

  def test_binary_search
    assert_equal true, binary_search(@a, 3)
    assert_equal false, binary_search(@a, 0)
    assert_equal false, binary_search(@a, 5)
  end

  def test_equal_range
    assert_equal [2, 3], equal_range(@a, 3)
    assert_equal [2, 2], equal_range(@a, 2.5)
  end
end
