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
    assert count(ary, 2) is 1

def test_count_if(ary):
    assert count_if(ary, lambda x: x == 2) is 1

def test_mismatch(ary):
    ary2 = [1, 2, 3, 5, 6]
    mismatch_pair = mismatch(ary, ary2)
    assert mismatch_pair[0] is 3
    mismatch_pair = mismatch(ary, ary)
    assert mismatch_pair[0] is None
    assert mismatch_pair[1] is None

def test_equal(ary):
    ary2 = [i + 1 for i in ary]
    assert equal(ary, ary2, lambda x, y: x + 1 == y)

def test_find(ary):
    assert find(ary, 3) is 2

def test_find_if(ary):
    assert find_if(ary, lambda x: x > 2) is 2
    assert find_if(ary, lambda x: x > 20) is None

def test_find_if_not(ary):
    assert find_if_not(ary, lambda x: x < 3) is 2
    assert find_if_not(ary, lambda x: x > 0) is None

def test_find_end():
    ary = [1, 2, 1, 2, 3]
    ary2 = [1, 2]
    ary3 = [1, 2, 3]
    ary4 = [1, 2, 3, 4]
    assert find_end(ary, ary2) is 2
    assert find_end(ary, ary3) is 2
    assert find_end(ary, ary4) is None

def test_find_first_of(ary):
    ary2 = [10, 8, 2]
    assert find_first_of(ary, ary2) is 1
    ary3 = [10, 8]
    assert find_first_of(ary, ary3) is None

def test_search(ary):
    ary2 = [2, 3, 4]
    assert search(ary, ary2) is 1
    ary3 = [3, 5]
    assert search(ary, ary3) is None
    ary4 = [1, 2, 3, 4, 5]
    assert search(ary, ary4) is 0
    ary5 = [1, 2, 3, 4, 5, 6]
    assert search(ary, ary5) is None

def test_search_n():
    ary = [1, 1, 2, 3]
    assert search_n(ary, 3, 1) is None
    assert search_n(ary, 2, 1) is 0
