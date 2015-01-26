# Implementations of partition algorithms

def is_partitioned(iterable, func):
    pass_partition_point = False
    for i in iterable :
        if not pass_partition_point :
            if not func(i) :
                pass_partition_point = True
        else :
            if func(i) :
                return False
    return True

def partition_point(iterable, func):
    for i, v in enumerate(iterable) :
        if not func(v) :
            return i

def partition(seq, func):
    pivot = partition_point(seq, func)
    for i in range(pivot, len(seq)) :
        if func(seq[i]) :
            seq[pivot], seq[i] = seq[i], seq[pivot]
            pivot += 1

def partition_copy(seq, func):
    res = []
    remain = []
    for i in seq :
        if func(i) : res.append(i)
        else : remain.append(i)
    res.extend(remain)
    return res

def stable_partition(seq, func):
    for i in range(0, len(seq)) :
        if not func(seq[i]) :
            v = seq[i]
            seq.remove(v)
            seq.append(v)
