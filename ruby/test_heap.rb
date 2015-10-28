require 'minitest/autorun'
require_relative 'heap'

class TestHeap < MiniTest::Test
  include Heap

  def setup
    @a = [2, 3, 1, 4, 5]
    @h = [1, 2, 3, 5, 4]
  end

  def test_is_heap
    assert_equal false, is_heap(@a)
    assert_equal true, is_heap(@h)
  end

  def test_is_heap_until
    assert_equal 2, is_heap_until(@a)
    assert_equal @h.size, is_heap_until(@h)
  end

  def test_sort_heap
    assert_equal [1, 2, 3, 4, 5], sort_heap(@a)
  end

  def test_pop_heap
    make_heap @a
    assert_equal 1, pop_heap(@a)
  end

  def test_push_heap
    push_heap(@h, 3)
    assert_equal true, is_heap(@h)
  end

  def test_make_heap
    make_heap @a
    assert_equal true, is_heap(@a)

    make_heap @h
    assert_equal true, is_heap(@h)
  end
end
