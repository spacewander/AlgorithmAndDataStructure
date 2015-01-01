# Implementations of modifying sequence algorithms
from itertools import islice, ifilter, ifilterfalse, imap

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
    for i, _ in enumerate(seq) :
        seq[i] = value

def fill_n(seq, value, count):
    for i in range(0, count) :
        seq[i] = value

def transform(iter, func):
    return [func(i) for i in iter]

def generate(seq, func):
    for i, _ in enumerate(seq) :
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
        if x == before : return after
        else : return x
    return imap(_replace_func, iter)

def replace_if(iter, func, after):
    def _replace_if(x):
        if func(x) : return after
        else : return x
    return imap(_replace_if, iter)

def replace_copy(iter, before, after):
    return [i for i in replace(iter, before, after)]

def replace_copy_if(iter, func, after):
    return [i for i in replace_if(iter, func, after)]
