require 'minitest/autorun'
require_relative 'partition'

class TestPartition < MiniTest::Test
  include Partition

  def setup
    @ary = [1, 2, 3, 4, 5]
  end

  def test_is_partitioned
    assert_equal true, is_partitioned(@ary){|x| x < 3}
    assert_equal false, is_partitioned([2, 2, 3, 1]){|x| x < 3}
  end

  def test_partition_point
    assert_equal 2, partition_point(@ary){|x| x < 3}
  end

  def test_partition
    a = [1, 4, 2]
    partition(a){|x| x < 3}
    assert_equal true, is_partitioned(a){|x| x < 3}
  end

  def test_partition_copy
    assert_equal true, is_partitioned(partition_copy(@ary){|x| x < 3}){|x| x < 3}
  end

  def test_stable_partition
    a = [1, 4, 2]
    stable_partition(a){|x| x < 3}
    assert_equal [1, 2, 4], a
  end
end
