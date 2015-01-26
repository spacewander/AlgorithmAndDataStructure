import pytest
import sorting
from sorting import is_sorted, is_sorted_until, partial_sort, \
        partial_sort_copy, nth_element

@pytest.fixture
def ary():
    return [2, 3, 1, 4, 5]

def test_is_sorted_until(ary):
    assert is_sorted_until(ary) == 2
    sorted_ary = [1, 2, 3]
    assert is_sorted_until(sorted_ary) == len(sorted_ary)

def test_is_sorted(ary):
    assert not is_sorted(ary)
    ary.sort()
    assert is_sorted(ary)

def test_sort(ary):
    assert not is_sorted(ary)
    sorting.sort(ary)
    assert is_sorted(ary)

def test_partial_sort(ary):
    partial_sort(ary, 2)
    assert ary[0] == 1
    assert ary[1] == 2
    partial_sort(ary, 3)
    assert ary[2] == 3

def test_partial_sort_copy(ary):
    assert partial_sort_copy(ary, 2) == [1, 2]

def test_stable_sort():
    pairs = [(1, 0), (2, 1), (2, 2), (2, 3), (1, 2), (3, 1)]
    sorting.stable_sort(pairs, lambda x, y: x[0] < y[0])
    assert pairs == sorted(pairs, key=lambda x: x[0])

def test_nth_element(ary):
    nth_element(ary, 3)
    assert ary[2] == 3
    nth_element(ary, 2)
    assert ary[1] == 2

