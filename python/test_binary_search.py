import pytest
import binary_search as bs

@pytest.fixture
def ary():
    return [1, 2, 3, 4]

def test_lower_bound(ary):
    assert ary[bs.lower_bound(ary, 3)] == 3
    assert ary[bs.lower_bound(ary, 2.5)] == 3
    assert ary[bs.lower_bound(ary, 1)] == 1
    assert bs.lower_bound(ary, 5) == len(ary)

def test_upper_bound(ary):
    assert bs.upper_bound(ary, 4) == len(ary)
    assert ary[bs.upper_bound(ary, 2.5)] == 3
    assert ary[bs.upper_bound(ary, 3)] == 4

def test_binary_search(ary):
    assert bs.binary_search(ary, 3)
    assert not bs.binary_search(ary, 5)

# the return value of equal_range is index instead of value
def test_equal_range(ary):
    assert bs.equal_range(ary, 3) == (2, 3)
    assert bs.equal_range(ary, 2.5) == (2, 2)
