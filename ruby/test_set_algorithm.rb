require 'minitest/autorun'
require_relative 'set_algorithm'

class TestSetAlgorithm < MiniTest::Test
  include SetAlgorithm

  def setup
    @a1 = [1, 2, 3, 4]
    @a2 = [3, 4, 5, 6]
  end

  def test_merge
    assert_equal [1, 2, 3, 4, 5, 6], merge(@a1, @a2)
  end

  def test_inplace_merge
    assert_equal [1, 2, 3, 4, 5, 6], inplace_merge(@a1, @a2)
  end

  def test_includes
    assert_equal true, includes(@a1, [1, 2])
    assert_equal false, includes(@a1, [5, 6])
    assert_equal true, includes(@a1, [])
  end

  def test_union
    assert_equal [1, 2, 3, 4, 5, 6], union(@a1, @a2)
  end

  def test_difference
    assert_equal [1, 2], difference(@a1, @a2)
  end

  def test_symmetric_difference
    assert_equal [1, 2, 5, 6], symmetric_difference(@a1, @a2)
  end

  def test_intersection
    assert_equal [3, 4], intersection(@a1, @a2)
  end
end
