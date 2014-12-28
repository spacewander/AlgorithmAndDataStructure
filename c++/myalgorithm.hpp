#ifndef MYALGORITHM_H
#define MYALGORITHM_H

#include <algorithm>
#include <functional>

namespace my {

// Non-modifying sequence
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

}
#endif /* MYALGORITHM_H */
