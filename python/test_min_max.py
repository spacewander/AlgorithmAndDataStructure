import pytest
import itertools
import min_max

@pytest.fixture
def ary():
    return [2, 3, 1, 4, 5]

def test_min():
    assert min_max.min(2, 3) == 2

def test_max():
    assert min_max.max(2, 3) == 3

def test_max_element(ary):
    assert min_max.max_element(ary) == 5

def test_min_element(ary):
    assert min_max.min_element(ary) == 1

def test_minmax():
    minmax = min_max.minmax(2, 3)
    assert minmax[0] == 2
    assert minmax[1] == 3

def test_minmax_element(ary):
    minmax = min_max.minmax_element(ary)
    assert minmax[0] == 1
    assert minmax[1] == 5

def test_lexicographical_compare():
    a = 'abcd'
    b = 'abce'
    assert min_max.lexicographical_compare(a, b)
    c = 'abcde'
    assert not min_max.lexicographical_compare(c, a)
    assert min_max.lexicographical_compare(a, c)

def test_is_permutation(ary):
    assert min_max.is_permutation(ary, [1, 2, 3, 4, 5])
    assert not min_max.is_permutation(ary, [1, 2, 2, 4, 5])
    assert not min_max.is_permutation(ary, [1, 2, 3])

def test_next_permutation(ary):
    min_max.next_permutation(ary)
    assert ary == list(itertools.permutations(ary).next())

def test_prev_permutation(ary):
    next_ary = ary[:]
    min_max.prev_permutation(ary)
    # assume next_permutation is correct
    min_max.next_permutation(ary)
    assert next_ary == ary

