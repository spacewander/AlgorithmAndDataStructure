# Implementations of binary search algorithms.
# Require all sequence is sorted

def lower_bound(seq, value):
    count = len(seq)
    start = 0
    while count > 0 :
        i = start
        step = count / 2
        i += step
        if seq[i] < value :
            start = i + 1
            count -= step + 1
        else :
            count = step
    return start

def upper_bound(seq, value):
    count = len(seq)
    start = 0
    while count > 0 :
        i = start
        step = count / 2
        i += step
        if seq[i] <= value :
            start = i + 1
            count -= step + 1
        else :
            count = step
    return start

def binary_search(seq, value):
    i = lower_bound(seq, value)
    return not (i == len(seq)) and value >= seq[i]

def equal_range(seq, value):
    return (lower_bound(seq, value), upper_bound(seq, value))
