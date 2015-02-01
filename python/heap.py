# Implementation of heap algorithms

from heapq import heappush, heappop, heapify

def sort_heap(seq):
    h = []
    for v in seq :
        heappush(h, v)
    return [heappop(h) for i in range(len(h))]

def is_heap(seq):
    if len(seq) == 0 : return True
    for i in range(1, len(seq)) :
        if seq[i] < seq[int((i - 1)/ 2)] :
            return False
    return True

def is_heap_until(seq):
    if len(seq) == 0 : return 0
    for i in range(1, len(seq)) :
        if seq[i] < seq[int((i - 1)/ 2)] :
            return i
    return len(seq)

def push_heap(seq, value):
    seq.append(value)
    heapify(seq)

def pop_heap(seq):
    tmp = seq.pop(0)
    heapify(seq)
    return tmp

# the heap made by heapq.heapify is a min-heap, so we construct a min-heap here
def make_heap(seq):
    heap_size = len(seq)
    for cur in range(int(heap_size / 2) - 1, -1, -1) :
        while True :
            left = 2 * cur + 1
            if left >= heap_size : break
            if seq[left] < seq[cur] : smallest = left
            else : smallest = cur
            right = left + 1
            if right < heap_size and seq[right] < seq[smallest] :
                smallest = right
            if seq[smallest] != seq[cur] :
                seq[cur], seq[smallest] = seq[smallest], seq[cur]
                cur = smallest
            else : break

