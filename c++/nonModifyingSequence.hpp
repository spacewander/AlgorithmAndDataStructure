#ifndef NONMODIFYINGSEQUENCE_H
#define NONMODIFYINGSEQUENCE_H

#include <algorithm>

namespace my {

template<typename InputIt, typename UnaryPredicate>
bool all_of(InputIt start, InputIt end, UnaryPredicate f)
{
    return std::find_if_not(start, end, f) == end;
}

template<typename InputIt, typename UnaryPredicate>
bool any_of(InputIt start, InputIt end, UnaryPredicate f)
{
    return std::find_if(start, end, f) != end;
}

template<typename InputIt, typename UnaryPredicate>
bool none_of(InputIt start, InputIt end, UnaryPredicate f)
{
    return std::find_if(start, end, f) == end;
}

template<typename InputIt, typename UnaryPredicate>
void for_each(InputIt start, InputIt end, UnaryPredicate f)
{
    for (; start != end; ++start) {
        f(*start);
    }
}

template<typename InputIt, typename T>
unsigned int count(InputIt start, InputIt end, const T &match)
{
    unsigned int num = 0;
    for (; start != end; ++start) {
        if ((*start) == match) {
            ++num;
        }
    }
    return num;
}

template<typename InputIt, typename UnaryPredicate>
unsigned int count_if(InputIt start, InputIt end, UnaryPredicate f)
{
    unsigned int num = 0;
    for (; start != end; ++start) {
        if (f(*start)) {
            ++num;
        }
    }
    return num;
}

template<typename InputIt1, typename InputIt2, typename BinaryPredicate>
std::pair<InputIt1, InputIt2> mismatch(InputIt1 start1, InputIt1 end, 
        InputIt2 start2, BinaryPredicate f)
{
    while (start1 != end && f(*start1, *start2)) {
        ++start1, ++start2;
    }
    return std::make_pair(start1, start2);
}

template<typename InputIt1, typename InputIt2, typename BinaryPredicate>
bool equal(InputIt1 start1, InputIt1 end1, InputIt2 start2, InputIt2 end2, 
        BinaryPredicate f)
{
    if (std::distance(start1, end1) == std::distance(start2, end2)) {
        for (; start1 != end1; ++start1, ++start2) {
            if (!f(*start1, *start2)) {
                return false;
            }
        }
        return true;
    }
    return false;
}

template<typename InputIt, typename T>
InputIt find(InputIt start, InputIt end, const T &match)
{
    for (; start != end; ++start) {
        if ((*start) == match) {
            return start;
        }
    }
    return end;
}

template<typename InputIt, typename UnaryPredicate>
InputIt find_if(InputIt start, InputIt end, UnaryPredicate f)
{
    for (; start != end; ++start) {
        if (f(*start)) {
            return start;
        }
    }
    return end;
}

// not1 does not work with lambda yet, so we can't write below code:
// return std::find_if(start, end, std::not1(f));
template<typename InputIt, typename UnaryPredicate>
InputIt find_if_not(InputIt start, InputIt end, UnaryPredicate f)
{
    for (; start != end; ++start) {
        if (!f(*start)) {
            return start;
        }
    }
    return end;
}

template<typename ForwardIt1, typename ForwardIt2, typename BinaryPredicate>
ForwardIt1 find_end(ForwardIt1 start, ForwardIt1 end, 
                    ForwardIt2 subStart, ForwardIt2 subEnd, BinaryPredicate f)
{
    if (subStart == subEnd) {
        return end;
    }
    ForwardIt1 result = end;
    while (true) {
        ForwardIt1 curResult = std::search(start, end, subStart, subEnd, f);
        if (curResult == end) {
            return result;
        } 
        else {
            result = curResult;
            start = result;
            ++start;
        }
    }
}

template<typename InputIt, typename ForwardIt, typename BinaryPredicate>
ForwardIt find_first_of(InputIt start, InputIt end, 
                    ForwardIt subStart, ForwardIt subEnd, BinaryPredicate f)
{
    for (; start != end; ++start) {
        for (ForwardIt it = subStart; it != subEnd; ++it) {
            if (f(*start, *it)) {
                return start;
            }
        }
    }
    return end;
}

template<typename ForwardIt, typename BinaryPredicate>
ForwardIt adjacent_find(ForwardIt start, ForwardIt end, BinaryPredicate f)
{
    if (start == end) {
        return end;
    }
    for (ForwardIt next = std::next(start); next != end; ++next, ++start) {
        if (f(*start, *next)) {
            return start;
        }
    }
    return end;
}

template<typename ForwardIt1, typename ForwardIt2, typename BinaryPredicate>
ForwardIt1 search(ForwardIt1 start, ForwardIt1 end, 
                  ForwardIt2 subStart, ForwardIt2 subEnd, BinaryPredicate f)
{
    while (true) {
        ForwardIt1 it = start;
        for (ForwardIt2 subIt = subStart;; ++it, ++subIt) {
            if (subIt == subEnd) {
                return start;
            }
            if (it == end) {
                return end;
            }
            if (!f(*it, *subIt)) {
                break;
            }
        }
        ++start;
    }
}

template<typename ForwardIt, typename T, typename BinaryPredicate>
ForwardIt search_n(ForwardIt start, ForwardIt end, const int count, 
        const T &match, BinaryPredicate f)
{
    for (; start != end; ++start) {
        if (!f(*start, match)) {
            continue;
        }
        ForwardIt result = start;
        int curCount = 0;
        while (++curCount > 0) {
            if (curCount == count) {
                return result;
            }
            ++start;
            if (start == end) {
                return end;
            }
            if (!f(*start, match)) {
                break;
            }
        }
    }
    return end;

}

}
#endif /* NONMODIFYINGSEQUENCE_H */
