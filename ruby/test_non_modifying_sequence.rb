require 'minitest/autorun'
require_relative 'non_modifying_sequence'

class TestNonModifyingSequence < MiniTest::Test
  include NonModifyingSequence

  def setup
    @ary = [1, 2, 3, 4, 5]
  end

  def test_all_of
    assert_equal true, all_of(@ary){|x| x < 6}
    assert_equal false, all_of(@ary){|x| x < 4}
  end

  def test_any_of
    assert_equal true, any_of(@ary){|x| x < 4}
  end

  def test_none_of
    assert_equal false, none_of(@ary){|x| x < 4}
    assert_equal true, none_of(@ary){|x| x > 6}
  end

  def test_for_each
    new_ary = @ary.each{|x| x + 1}
    assert_equal new_ary, for_each(@ary){|x| x + 1}
  end

  def test_count
    assert_equal 1, count(@ary, 2)
  end

  def test_count_if
    assert_equal 1, count_if(@ary){|x| x == 2}
  end

  def test_mismatch
    ary2 = [1, 2, 3, 5, 6]
    # return the mismatch index
    assert_equal 3, mismatch(@ary, ary2)[0]
    assert_equal 3, mismatch(@ary, ary2)[1]
    assert_equal nil, mismatch(@ary, @ary)[0]
    assert_equal nil, mismatch(@ary, @ary)[1]

    assert_equal 0, mismatch(@ary, @ary){|x, y| x != y}[0]
  end

  def test_equal
    ary2 = @ary.map{|x| x + 1}
    assert_equal true, equal(@ary, ary2){|x, y| x + 1 == y}
    assert_equal true, equal(@ary, @ary)
    assert_equal false, equal(@ary, [1, 2, 3])
  end

  def test_find
    assert_equal 2, find(@ary, 3)
  end

  def test_find_if
    assert_equal 2, find_if(@ary){|x| x > 2}
    assert_equal nil, find_if(@ary){|x| x > 20}
  end

  def test_find_if_not
    assert_equal 2, find_if_not(@ary){|x| x < 3}
    assert_equal nil, find_if_not(@ary){|x| x > 0}
  end

  def test_find_end
    ary = [1, 2, 1, 2, 3]
    ary2 = [1, 2]
    ary3 = [1, 2, 3]
    ary4 = [1, 2, 3, 4]
    assert_equal 2, find_end(ary, ary2)
    assert_equal 2, find_end(ary, ary3)
    assert_equal nil, find_end(ary, ary4)
  end

  def test_find_first_of
    ary2 = [10, 8, 2]
    assert_equal 1, find_first_of(@ary, ary2)
    ary3 = [10, 8]
    assert_equal nil, find_first_of(@ary, ary3)
    assert_equal 0, find_first_of(@ary, ary3){|x, y| x != y}
  end

  def test_search
    ary2 = [2, 3, 4]
    assert_equal 1, search(@ary, ary2)
    ary3 = [3, 5]
    assert_equal nil, search(@ary, ary3)
    ary4 = [1, 2, 3, 4, 5]
    assert_equal 0, search(@ary, ary4)
    ary5 = [1, 2, 3, 4, 5, 6]
    assert_equal nil, search(@ary, ary5)
  end

  def test_search_n
    ary = [1, 1, 2, 3]
    assert_equal nil, search_n(ary, 3, 1)
    assert_equal 0, search_n(ary, 2, 1)
  end
end
