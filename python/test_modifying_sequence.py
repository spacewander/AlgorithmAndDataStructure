import pytest
from modifying_sequence import *

@pytest.fixture
def ary():
    return [1, 2, 3, 4, 5]

def test_copy(ary):
    assert [i for i in copy(ary, 0, 3)] == ary[:3]

def test_copy_if(ary):
    assert [i for i in copy_if(ary, lambda x: x < 4)] == [1, 2, 3]

def test_copy_n(ary):
    assert [i for i in copy_n(ary, 3)] == ary[:3]

def test_copy_backward(ary):
    assert [i for i in copy_backward(ary, 0, 3)] == ary[2::-1]

def test_move(ary):
    assert [i for i in move(ary, 0, 3)] == ary[:3]

def test_move_backward(ary):
    assert [i for i in move_backward(ary, 0, 3)] == ary[2::-1]

def test_fill(ary):
    fill(ary, 3)
    assert ary == [3, 3, 3, 3, 3]

def test_fill_n(ary):
    fill_n(ary, 3, 2)
    assert ary == [3, 3, 3, 4, 5]

def test_transform(ary):
    assert transform(ary, [], lambda x: x + 1) == [2, 3, 4, 5, 6]
    a = dict([(1, '1'), (2, '2')])
    assert transform(a, {}, lambda k: (k, k)) == dict([(1, 1), (2, 2)])

def test_generate(ary):
    generate(ary, lambda :3)
    assert ary == [3, 3, 3, 3, 3]

def test_generate_n(ary):
    generate_n(ary, lambda :3, 3)
    assert ary == [3, 3, 3, 4, 5]
