# Implementations of set algorithms.

# Both merge and inplace_merge require seq1 and seq2 are sorted.
# And result they returned is sorted too.
def merge(seq1, seq2):
    res = []
    i = j = 0
    while i < len(seq1) and j < len(seq2) :
        if seq2[j] < seq1[i] :
            res.append(seq2[j])
            j += 1
        elif seq1[i] == seq2[j] :
            res.append(seq1[i])
            i += 1
            j += 1
        else :
            res.append(seq1[i])
            i += 1
    if i == len(seq1) : res.extend(seq2[j:])
    else : res.extend(seq1[i:])
    return res

def inplace_merge(seq1, seq2):
    j = 0
    seq2_len = len(seq2)
    for i in range(0, len(seq1)) :
        while seq1[i] >= seq2[j] and j < seq2_len :
            if seq1[i] > seq2[j] : seq1.insert(i, seq2[j])
            j += 1
    seq1.extend(seq2[j:])

def includes(seq1, seq2):
    for v in seq2 :
        if v not in seq1 : return False
    return True

def union(seq1, seq2):
    res = [v for v in seq1 if v not in seq2]
    res.extend(seq2)
    return res

def difference(seq1, seq2):
    return [v for v in seq1 if v not in seq2]

def symmetric_difference(seq1, seq2):
    return [v for v in seq1 if v not in seq2] + \
            [v for v in seq2 if v not in seq1]

def intersection(seq1, seq2):
    return [v for v in seq1 if v in seq2]

