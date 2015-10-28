require 'minitest/autorun'
require_relative 'sorting'

class TestSorting < MiniTest::Test
  include Sorting

  def setup
    @a = [2, 3, 1, 4, 5]
  end

  def test_is_sorted_until
    assert_equal 2, is_sorted_until(@a)
    sorted = [1, 2, 3]
    assert_equal sorted.size, is_sorted_until(sorted)
  end

  def test_is_sorted
    assert_equal false, is_sorted(@a)
    assert_equal true, is_sorted(@a.sort)
  end

  def test_sort
    assert_equal false, is_sorted(@a)
    sort(@a)
    assert_equal true, is_sorted(@a)
  end

  def test_partial_sort
    partial_sort(@a, 2)
    assert_equal 1, @a[0]
    assert_equal 2, @a[1]
    partial_sort(@a, 3)
    assert_equal 3, @a[2]
  end

  def test_partial_sort_copy
    assert_equal [1, 2], partial_sort_copy(@a, 2)
  end

  def test_stable_sort
    aries = [
      [1, 0], [2, 1], [2, 3], [2, 2], [1, 2], [3, 1]
    ]
    stable_sort(aries){|x, y| x[0] < y[0]}
    sorted = [
      [1, 0], [1, 2], [2, 1], [2, 3], [2, 2], [3, 1]
    ]
    assert_equal sorted, aries
  end

  def test_nth_element
    assert_equal 3, nth_element(@a, 2)
    assert_equal 1, nth_element(@a, 0)
  end
end
