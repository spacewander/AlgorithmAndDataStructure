# Implementations of modifying sequence algorithms
from itertools import islice, ifilter, ifilterfalse, imap
from random import randint

def copy(iter, start, end):
    return islice(iter, start, end)

def copy_if(iter, func):
    return ifilter(func, iter)

def copy_n(iter, count):
    return islice(iter, 0, count)

# require __slice__ is implemented
def copy_backward(iter, start, end):
    return reversed(iter[start:end])

# there are not move semantics in python(unlike C++), so implement it as copy
def move(iter, start, end):
    return islice(iter, start, end)

def move_backward(iter, start, end):
    return reversed(iter[start:end])

def fill(seq, value):
    for i in range(0, len(seq)) :
        seq[i] = value

def fill_n(seq, value, count):
    count = min(count, len(seq))
    for i in range(0, count) :
        seq[i] = value

def transform(iter, func):
    return [func(i) for i in iter]

def generate(seq, func):
    for i in range(0, len(seq)) :
        seq[i] = func()

def generate_n(seq, func, count):
    for i in range(0, count) :
        seq[i] = func()

# the problem is, iterate in dict return (k1, k2, ...) instead of ((k1, v1), ...)
def remove(iter, value):
    return ifilterfalse(lambda x: x == value, iter)

def remove_if(iter, func):
    return ifilterfalse(func, iter)

def remove_copy(iter, value):
    return [i for i in remove(iter, value)]

def remove_copy_if(iter, func):
    return [i for i in remove_if(iter, func)]

def replace(iter, before, after):
    def _replace_func(x):
        if x == before :
            return after
        else :
            return x
    return imap(_replace_func, iter)

def replace_if(iter, func, after):
    def _replace_if(x):
        if func(x) :
            return after
        else :
            return x
    return imap(_replace_if, iter)

def replace_copy(iter, before, after):
    return [i for i in replace(iter, before, after)]

def replace_copy_if(iter, func, after):
    return [i for i in replace_if(iter, func, after)]

def swap(a, b):
    return b, a

def swap_range(a, b, start, end):
    for i in range(start, end) :
        a[i], b[i] = b[i], a[i]

def iter_swap(a, b):
    return b, a

# require __setitem__ is implemented
def reverse(seq):
    end = len(seq) - 1
    for i in range(0, end / 2) :
        seq[i], seq[end - i] = seq[end - i], seq[i]

def reverse_copy(iter):
    return [i for i in reversed(iter)]

# require extra space to store tmp.
# An algorithm without extra space is possible, but not elegant.
def rotate(seq, pivot):
    tmp = seq[:pivot]
    tail = len(seq) - pivot
    for i in range(0, len(seq)) :
        if i < tail : seq[i] = seq[pivot + i]
        else : seq[i] = tmp[i - tail]

def rotate_copy(seq, pivot):
    return seq[pivot:] + seq[:pivot]

def shuffle(seq):
    length = len(seq)
    for i in range(0, length) :
        random = randint(0, i)
        seq[i], seq[random] = seq[random], seq[i]

def unique(seq):
    current = None
    for i in range(0, len(seq)) :
        if current != seq[i] :
            current = seq[i]
            yield seq[i]

def unique_copy(seq):
    return [i for i in unique(seq)]
