import pytest
from partition import *

@pytest.fixture
def ary():
    return [1, 2, 3, 4, 5]

def test_is_partitioned(ary):
    assert is_partitioned(ary, lambda x: x < 3 )
    assert not is_partitioned([2, 2, 3, 1], lambda x: x < 3)

def test_partition_point(ary):
    assert partition_point(ary, lambda x: x < 3) == 2

def test_partition_copy(ary):
    lt_three = lambda x: x < 3
    assert is_partitioned(partition_copy(ary, lt_three), lt_three)

def test_partition():
    a = [1, 4, 2]
    partition(a, lambda x: x < 3)
    assert is_partitioned(a, lambda x: x < 3)

def test_stable_partition():
    a = [1, 4, 2]
    stable_partition(a, lambda x: x < 3)
    assert a == [1, 2, 4]

