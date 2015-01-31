# Implementation of numeric algorithms

def itoa(v):
    value = v
    while True :
        yield value
        value += 1

def accumulate(seq, init, func):
    return reduce(func, seq, init)

def inner_production(seq1, seq2, init):
    if len(seq1) != len(seq2) :
        raise TypeError, "second sequence should be as long as the first one"
    return reduce(lambda x, y: x + y[0] * y[1], zip(seq1, seq2), init)

def adjacent_difference(seq):
    res = [seq[0]]
    def diff(x, y):
        res.append(y - x)
        return y
    reduce(diff, seq)
    return res

def partial_sum(seq):
    res = [seq[0]]
    def sum(x, y):
        res.append(x + y)
        return x + y
    reduce(sum, seq)
    return res

