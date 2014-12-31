import pytest
from non_modifying_sequence import *

@pytest.fixture
def ary():
    return [1, 2, 3, 4, 5]

def test_all_of(ary):
    assert all_of(ary, lambda x: x < 6)
    assert not all_of(ary, lambda x: x < 4)

def test_any_of(ary):
    assert any_of(ary, lambda x: x < 4)

def test_none_of(ary):
    assert not none_of(ary, lambda x: x < 4)
    assert none_of(ary, lambda x: x > 6)

def test_for_each(ary):
    new_ary = [i + 1 for i in ary]
    for_each(ary, lambda x: x + 1)
    assert new_ary == ary

def test_count(ary):
    assert count(ary, 2) == 1

def test_count_if(ary):
    assert count_if(ary, lambda x: x == 2) == 1

def test_mismatch(ary):
    ary2 = [1, 2, 3, 5, 6]
    mismatch_pair = mismatch(ary, ary2, lambda x, y: x == y)
    assert mismatch_pair[0] == 3

def test_equal(ary):
    ary2 = [i + 1 for i in ary]
    assert equal(ary, ary2, lambda x, y: x + 1 == y)

def test_find(ary):
    assert find(ary, 3) == 2

def test_find_if(ary):
    assert find_if(ary, lambda x: x > 2) == 2

def test_find_if_not(ary):
    assert find_if_not(ary, lambda x: x < 3) == 2
