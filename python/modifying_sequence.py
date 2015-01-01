# Implementations of modifying sequence algorithms
from itertools import islice, ifilter

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

def transform(iter1, iter2, func):
    iter2.__init__([func(i) for i in iter1])
    return iter2

def generate(seq, func):
    for i, _ in enumerate(seq) :
        seq[i] = func()

def generate_n(seq, func, count):
    for i in range(0, count) :
        seq[i] = func()
