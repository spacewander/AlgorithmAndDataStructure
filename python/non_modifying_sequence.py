# Implementations of non-modifying sequence algorithms

def all_of(iterable, func):
    return all(map(func, iterable))

def any_of(iterable, func):
    return any(map(func, iterable))

def none_of(iterable, func):
    return not any(map(func, iterable))

def for_each(iterable, func):
    for i, v in enumerate(iterable):
        iterable[i] = func(v)

def count(iterable, match):
    return list(iterable).count(match)

# It is too wasteful:
# return len(filter(func, iterable))
def count_if(iterable, func):
    num = 0
    for i in iterable :
        if func(i) :
            num += 1
    return num

def mismatch(iter1, iter2, func=lambda x, y: x == y):
    for tp in zip(enumerate(iter1), enumerate(iter2)) :
        if not func(tp[0][1], tp[1][1]) :
            return tp[0][0], tp[1][0]
    return None, None

def equal(iter1, iter2, func=lambda x, y: x == y):
    return all(map(func, iter1, iter2))

def find(iterable, match):
    return list(iterable).index(match)

def find_if(iterable, func):
    for i, v in enumerate(iterable) :
        if func(v) :
            return i
    return None

def find_if_not(iterable, func):
    for i, v in enumerate(iterable) :
        if not func(v) :
            return i
    return None

def find_end(iter1, iter2, func=lambda x, y: x == y):
    if len(iter2) is 0 or len(iter1) < len(iter2) :
        return None
    find_end = None
    for index in range(0, len(iter1) - len(iter2) + 1) :
        i = index
        for value in iter2 :
            found = func(iter1[i], value)
            if not found :
                break
            else :
                i += 1
        if found :
            find_end = index
    return find_end

def find_first_of(iter1, iter2, func=lambda x, y: x == y):
    for index, value1 in  enumerate(iter1) :
        for value2 in iter2 :
            if func(value1, value2) : return index
    return None

def search(iter1, iter2, func=lambda x, y: x == y):
    if len(iter2) is 0 or len(iter1) < len(iter2) :
        return None
    for index in range(0, len(iter1) - len(iter2) + 1) :
        i = index
        for value in iter2 :
            found = func(iter1[i], value)
            if not found :
                break
            else :
                i += 1
        if found :
            return index
    return None

def search_n(iterable, n, match, func=lambda x, y: x == y):
    return search(iterable, [match] * n, func)
