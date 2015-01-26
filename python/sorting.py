# Implementations of sorting algorithms.
# To keep simple, most implementations use < as compare method
import heapq
import functools

def sort(seq):
    def partition(seq, start, end):
        x = seq[end]
        i = start - 1
        for j in range(start, end) :
            if seq[j] <= x :
                i += 1
                seq[i], seq[j] = seq[j], seq[i]
        seq[i + 1], seq[end] = seq[end], seq[i + 1]
        return i + 1

    def quicksort(seq, start, end):
        if start < end :
            pivot = partition(seq, start, end)
            quicksort(seq, start, pivot - 1)
            quicksort(seq, pivot + 1, end)

    quicksort(seq, 0, len(seq) - 1)

def is_sorted(seq):
    for i in range(1, len(seq)) :
        if seq[i - 1] > seq[i] :
            return False
    return True

def is_sorted_until(seq):
    for i in range(1, len(seq)) :
        if seq[i - 1] > seq[i] :
            return i
    return len(seq)

def partial_sort(seq, border):
    partial = []
    heapq.heapify(seq)
    for i in range(0, border) :
        partial.append(heapq.heappop(seq))
    for i in reversed(partial) :
        seq.insert(0, i)

def partial_sort_copy(seq, border):
    heapq.heapify(seq)
    return heapq.nsmallest(border, seq)

def stable_sort(seq, func):
    heapq.heapify(seq)
    key = functools.cmp_to_key(func)
    seq[:] = heapq.nsmallest(len(seq), seq, key=key)

# n is one base.
def nth_element(seq, n):
    heapq.heapify(seq)
    seq[:n] = heapq.nsmallest(n, seq)

