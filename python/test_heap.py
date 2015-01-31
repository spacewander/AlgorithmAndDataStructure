import pytest
import heapq
import heap as h

@pytest.fixture
def ary():
    return [2, 3, 1, 4, 5]

def test_sort_heap(ary):
    assert h.sort_heap(ary) == [1, 2, 3, 4, 5]

def test_is_heap(ary):
    assert not h.is_heap(ary)
    heapq.heapify(ary)
    assert h.is_heap(ary)
    assert h.is_heap([2, 3, 4, 4, 4])

# is_heap_until return the index of first element
# which disobey the requirement of heap.
def test_is_heap_until(ary):
    assert h.is_heap_until(ary) == 2
    heapq.heapify(ary)
    assert h.is_heap_until(ary) == len(ary)

def test_pop_heap(ary):
    heapq.heapify(ary)
    min_value = h.pop_heap(ary)
    assert min_value == 1

def test_push_heap(ary):
    heapq.heapify(ary)
    h.push_heap(ary, 3)
    assert h.is_heap(ary)

def test_make_head(ary):
    h.make_heap(ary)
    assert h.is_heap(ary)

