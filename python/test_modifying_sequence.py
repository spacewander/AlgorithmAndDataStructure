import pytest
from modifying_sequence import *

@pytest.fixture
def ary():
    return [1, 2, 3, 4, 5]

@pytest.fixture
def set_x():
    return set([1, 2, 3])

@pytest.fixture
def dict_x():
    return dict([(1, '1'), (2, '2')])

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

def test_transform(ary, dict_x):
    a = transform(ary, lambda x: x + 1)
    assert a == [2, 3, 4, 5, 6]
    b = dict(transform(dict_x, lambda k: (k, k)))
    assert b == dict([(1, 1), (2, 2)])

def test_generate(ary):
    generate(ary, lambda :3)
    assert ary == [3, 3, 3, 3, 3]

def test_generate_n(ary):
    generate_n(ary, lambda :3, 3)
    assert ary == [3, 3, 3, 4, 5]

def test_remove(ary, set_x):
    assert [i for i in remove(ary, 4)] == [1, 2, 3, 5]
    assert set([i for i in remove(set_x, 3)]) == set([1, 2])
    # can't work on dict
    # assert [i for i in remove(dict_x, 1)] == [(2, '2')]

def test_remove_if(ary):
    assert [i for i in remove_if(ary, lambda x: x < 3)] == [3, 4, 5]

def test_remove_copy(ary, set_x):
    a = remove_copy(ary, 4)
    assert a == [1, 2, 3, 5]
    b = set(remove_copy(set_x, 3))
    assert b == set([1, 2])

def test_remove_copy_if(ary):
    a = remove_copy_if(ary, lambda x: x < 3)
    assert a == [3, 4, 5]

def test_replace(ary, set_x):
    assert [i for i in replace(ary, 4, 5)] == [1, 2, 3, 5, 5]
    assert set([i for i in replace(set_x, 3, 4)]) == set([1, 2, 4])

def test_replace_if(ary):
    assert [i for i in replace_if(ary, lambda x: x < 3, 1)] == \
            [1, 1, 3, 4, 5]

def test_replace_copy(ary, set_x):
    a = replace_copy(ary, 4, 3)
    assert a == [1, 2, 3, 3, 5]
    b = set(replace_copy(set_x, 3, 4))
    assert b == set([1, 2, 4])

def test_replace_copy_if(ary):
    a = replace_copy_if(ary, lambda x: x < 3, 1)
    assert a == [1, 1, 3, 4, 5]
