#ifndef MINMAX_H
#define MINMAX_H

#include <algorithm>

namespace my {

template<typename T>
const T& max(const T& a, const T& b)
{
    return (a < b) ? b : a;
}

template<typename T>
const T& min(const T& a, const T& b)
{
    return (a < b) ? a : b;
}

template<typename ForwordIt>
ForwordIt max_element(ForwordIt start, ForwordIt end)
{
    if (start == end) return end;
    ForwordIt largest = start;
    ++start;
    for (; start != end; ++start) {
        if (*largest < *start)
            largest = start;
    }
    return largest;
}

template<typename ForwordIt>
ForwordIt min_element(ForwordIt start, ForwordIt end)
{
    if (start == end) return end;
    ForwordIt smallest = start;
    ++start;
    for (; start != end; ++start) {
        if (*smallest > *start)
            smallest = start;
    }
    return smallest;
}

template<typename T>
std::pair<const T&, const T&> minmax(const T& a, const T& b)
{
    return (a < b) ? std::pair<const T&, const T&>(a, b) 
                   : std::pair<const T&, const T&>(b, a);
}

template<typename ForwordIt>
std::pair<ForwordIt, ForwordIt> minmax_element(ForwordIt start, ForwordIt end)
{
    std::pair<ForwordIt, ForwordIt> result(start, start);
    if (start == end) return result;
    while (++start != end) {
        if (*start < *result.first)
            result.first = start;
        if (*start >= *result.second)
            result.second = start;
    }
    return result;
}
}
#endif /* MINMAX_H */
