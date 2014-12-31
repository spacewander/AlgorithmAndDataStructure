def all_of(iterable, func):
    return all(map(func, iterable))

def any_of(iterable, func):
    return any(map(func, iterable))

def none_of(iterable, func):
    return not any(map(func, iterable))

def for_each(iterable, func):
    for i, v in enumerate(iterable): iterable[i] = func(v)

def count(iterable, match):
    return list(iterable).count(match)

# It is too wasteful:
# return len(filter(func, iterable))
def count_if(iterable, func):
    num = 0
    for i in iterable :
        if func(i) : num += 1
    return num

def mismatch(iter1, iter2, func):
    for tp in zip(enumerate(iter1), enumerate(iter2)) :
        if not func(tp[0][1], tp[1][1]) : return tp[0][0], tp[1][0]

def equal(iter1, iter2, func):
    return all(map(func, iter1, iter2))

def find(iterable, match):
    return list(iterable).index(match)

def find_if(iterable, func):
    for i, v in enumerate(iterable) :
        if func(v) : return i

def find_if_not(iterable, func):
    for i, v in enumerate(iterable) :
        if not func(v) : return i
