#ifndef MYALGORITHM_H
#define MYALGORITHM_H

#include <algorithm>
#include <functional>

namespace my {

// Non-modifying sequence
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

template<typename ForwordIt1, typename ForwordIt2, typename BinaryPredicate>
ForwordIt1 find_end(ForwordIt1 start, ForwordIt1 end, 
                    ForwordIt2 subStart, ForwordIt2 subEnd, BinaryPredicate f)
{
    if (subStart == subEnd) {
        return end;
    }
    ForwordIt1 result = end;
    while (true) {
        ForwordIt1 curResult = std::search(start, end, subStart, subEnd, f);
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

template<typename InputIt, typename ForwordIt, typename BinaryPredicate>
ForwordIt find_first_of(InputIt start, InputIt end, 
                    ForwordIt subStart, ForwordIt subEnd, BinaryPredicate f)
{
    for (; start != end; ++start) {
        for (ForwordIt it = subStart; it != subEnd; ++it) {
            if (f(*it, *start)) {
                return start;
            }
        }
    }
    return end;
}

template<typename ForwordIt, typename BinaryPredicate>
ForwordIt adjacent_find(ForwordIt start, ForwordIt end, BinaryPredicate f)
{
    if (start == end) {
        return end;
    }
    for (ForwordIt next = std::next(start); next != end; ++next, ++start) {
        if (f(*start, *next)) {
            return start;
        }
    }
    return end;
}

template<typename ForwordIt1, typename ForwordIt2, typename BinaryPredicate>
ForwordIt1 search(ForwordIt1 start, ForwordIt1 end, 
                  ForwordIt2 subStart, ForwordIt2 subEnd, BinaryPredicate f)
{
    while (true) {
        ForwordIt1 it = start;
        for (ForwordIt2 subIt = subStart;; ++it, ++subIt) {
            if (!f(*it, *subIt)) {
                break;
            }
            if (subIt == subEnd) {
                return start;
            }
            if (it == end) {
                return end;
            }
        }
        ++start;
    }
}

template<typename ForwordIt, typename T, typename BinaryPredicate>
ForwordIt search_n(ForwordIt start, ForwordIt end, const int count, 
        const T &match, BinaryPredicate f)
{
    for (; start != end; ++start) {
        if (!f(*start, match)) {
            continue;
        }
        ForwordIt result = start;
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
#endif /* MYALGORITHM_H */
