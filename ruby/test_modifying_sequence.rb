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
end
