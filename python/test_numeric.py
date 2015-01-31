import pytest
import numeric as n

@pytest.fixture
def ary():
    return [1, 2, 3]

def test_itoa():
    g = n.itoa(1)
    assert 1 == g.next()
    assert 2 == g.next()

def test_accumulate(ary):
    assert n.accumulate(ary, 1, lambda x, y : x * y) == 6

def test_inner_product(ary):
    assert n.inner_production(ary, ary, 0) == 14

def test_adjacent_difference(ary):
    assert n.adjacent_difference(ary) == [1, 1, 1]

def test_partial_sum(ary):
    assert n.partial_sum(ary) == [1, 3, 6]

