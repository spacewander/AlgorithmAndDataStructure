# Implementation of min/max algorithms

def max(a, b):
    if a < b : return b
    return a

def min(a, b):
    if a < b : return a
    return b

# Unlike one implemented in c++, this version return value instead of index
def max_element(seq):
    return reduce(max, seq)

def min_element(seq):
    return reduce(min, seq)

def minmax(a, b):
    if a < b : return (a, b)
    return (b, a)

def minmax_element(seq):
    return (reduce(min, seq), reduce(max, seq))

# if seq1 is lexicographically less than seq2
def lexicographical_compare(seq1, seq2):
    if len(seq2) < len(seq1) : return False
    for pair in zip(seq1, seq2) :
        if pair[0] < pair[1] : return True
        if pair[1] < pair[0] : return False
    return True

def is_permutation(seq1, seq2):
    if len(seq1) != len(seq2) : return False
    pair = {}
    for i in seq1 :
        if i in pair :
            pair[i] += 1
        else :
            pair[i] = 1
    for j in seq2 :
        if j in pair :
            pair[j] -= 1
            if pair[j] < 0 : return False
        else :
            return False
    return True

def next_permutation(seq):
    if len(seq) <= 1 :
        return False
    i = len(seq) - 1
    while True :
        i1 = i
        i -= 1
        if seq[i] < seq[i1] :
            i2 = len(seq) - 1
            while seq[i] >= seq[i2] :
                i2 -= 1
            seq[i], seq[i2] = seq[i2], seq[i]
            seq[i1:] = reversed(seq[i1:])
            return True
        if i == 0 :
            seq.reverse()
            return False

def prev_permutation(seq):
    if len(seq) <= 1 :
        return False
    i = len(seq) - 1
    while True :
        i1 = i
        i -= 1
        if seq[i1] < seq[i] :
            i2 = len(seq) - 1
            while seq[i2] >= seq[i] :
                i2 -= 1
            seq[i], seq[i2] = seq[i2], seq[i]
            seq[i1:] = reversed(seq[i1:])
            return True
        if i == 0 :
            seq.reverse()
            return False

