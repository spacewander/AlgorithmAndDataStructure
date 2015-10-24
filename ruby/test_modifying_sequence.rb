require 'minitest/autorun'
require 'set'
require_relative 'modifying_sequence'

class TestModifyingSequence < MiniTest::Test
  include ModifyingSequence

  def setup
    @ary = [1, 2, 3, 4, 5]
    @set = Set.new([1, 2, 3])
    @hash = {1 => '1', 2 => '2'}
    @duplicate_ary = [1, 2, 2, 2, 4]
  end

  def test_copy
    assert_equal @ary[0..2], copy(@ary, 0, 3)
  end

  def test_copy_if
    assert_equal [1, 2, 3], copy_if(@ary){|x| x < 4}
  end

  def test_copy_n
    assert_equal @ary[0..2], copy_n(@ary, 3)
  end

  def test_copy_backward
    assert_equal @ary[0..2].reverse, copy_backward(@ary, 0, 3)
  end

  # move is as the same as copy
  def test_move
    assert_equal @ary[0..2], move(@ary, 0, 3)
  end

  def test_move_backward
    assert_equal @ary[0..2].reverse, move_backward(@ary, 0, 3)
  end

  def test_fill
    fill(@ary, 3)
    assert_equal Array.new(5, 3), @ary
  end

  def test_transform
    assert_equal [2, 3, 4, 5, 6], transform(@ary){|x| x + 1}
  end

  def test_generate
    assert_equal Array.new(5, 3), generate(@ary){3}
  end

  def test_generate_n
    assert_equal [3, 3, 3, 4, 5], generate_n(@ary, 3){3}
  end

  def test_remove
    assert_equal [1, 2, 3, 5], remove(@ary, 4)
    assert_equal Set.new([1, 2]), Set.new(remove(@set, 3))
    removed_hash = {2 => '2'}
    assert_equal removed_hash, remove(@hash, 1)
  end

  def test_remove_if
    assert_equal [3, 4, 5], remove_if(@ary){|x| x < 3}
  end

  def test_remove_copy
    assert_equal [1, 2, 3, 5], remove_copy(@ary, 4)
    assert_equal Set.new([1, 2]), Set.new(remove_copy(@set, 3))
  end

  def test_remove_copy_if
    assert_equal [3, 4, 5], remove_copy_if(@ary){|x| x < 3}
  end

  def test_replace
    assert_equal [1, 2, 3, 5, 5], replace(@ary, 4, 5)
    assert_equal Set.new([1, 2, 4]), Set.new(replace(@set, 3, 4))
  end

  def test_replace_if
    assert_equal [1, 1, 3, 4, 5], replace_if(@ary, 1){|x| x < 3}
  end

  def test_swap
    another_ary = [5, 4, 3, 2, 1]
    after_swap_ary = Array.new(another_ary)
    after_swap_another_ary = Array.new(@ary)
    @ary, another_ary = swap(@ary, another_ary)
    assert_equal after_swap_ary, @ary
    assert_equal after_swap_another_ary, another_ary
  end

  def test_swap_range
    another_ary = [5, 4, 3]
    swap_range(@ary, another_ary, 0, 3)
    assert_equal [5, 4, 3, 4, 5], @ary
    assert_equal [1, 2, 3], another_ary
  end

  def test_reverse
    reverse(@ary)
    assert_equal [5, 4, 3, 2, 1], @ary
  end

  def test_rotate
    assert_equal [4, 5, 1, 2, 3], rotate(@ary, 3)
  end

  def test_rotate_copy
    assert_equal [4, 5, 1, 2, 3], rotate_copy(@ary, 3)
  end

  def test_shuffle
    shuffle @ary
  end

  def test_unique
    assert_equal [1, 2, 4], unique(@duplicate_ary)
  end
end
