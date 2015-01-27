import pytest
# distiguish from built-in set
import set_algorithm

@pytest.fixture
def ary1():
    return [1, 2, 3, 4]

@pytest.fixture
def ary2():
    return [3, 4, 5, 6]

def test_merge(ary1, ary2):
    assert set_algorithm.merge(ary1, ary2) == [1, 2, 3, 4, 5, 6]

def test_inplace_merge(ary1, ary2):
    set_algorithm.inplace_merge(ary1, ary2)
    assert ary1 == [1, 2, 3, 4, 5, 6]

def test_includes(ary1):
    assert set_algorithm.includes(ary1, [1, 2])
    assert not set_algorithm.includes(ary1, [5, 6])
    # an empty array can be included by every array
    assert set_algorithm.includes(ary1, [])

def test_union(ary1, ary2):
    assert set_algorithm.union(ary1, ary2) == [1, 2, 3, 4, 5, 6]

def test_difference(ary1, ary2):
    assert set_algorithm.difference(ary1, ary2) == [1, 2]

def test_symmetric_difference(ary1, ary2):
    assert set_algorithm.symmetric_difference(ary1, ary2) == [1, 2, 5, 6]

def test_intersection(ary1, ary2):
    assert set_algorithm.intersection(ary1, ary2) == [3, 4]

