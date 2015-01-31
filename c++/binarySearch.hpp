#ifndef BINARY_SEARCH_H
#define BINARY_SEARCH_H

#include <algorithm>

namespace my {

template<typename ForwordIt, typename T>
ForwordIt lower_bound(ForwordIt start, ForwordIt end, const T& value)
{
    ForwordIt it;
    size_t count = std::distance(start, end);
    size_t step;
    while (count > 0) {
        it = start;
        step = count / 2;
        std::advance(it, step);
        if (*it < value) {
            start = ++it;
            count -= step + 1;
        }
        else
            count = step;
    }
    return start;
}

template<typename ForwordIt, typename T>
ForwordIt upper_bound(ForwordIt start, ForwordIt end, const T& value)
{
    ForwordIt it;
    size_t count = std::distance(start, end);
    size_t step;
    while (count > 0) {
        it = start;
        step = count / 2;
        std::advance(it, step);
        if (*it >= value) {
            start = ++it;
            count -= step + 1;
        }
        else
            count = step;
    }
    return start;
}

template<typename ForwordIt, typename T, typename Compare>
bool binary_search(ForwordIt start, ForwordIt end, const T& value, Compare cp)
{
    start = std::lower_bound(start, end, value, cp);
    return (!(start == end) && !(cp(value, *start)));
}

template<typename ForwordIt, typename T>
std::pair<ForwordIt, ForwordIt> equal_range(ForwordIt start, ForwordIt end, 
        const T& value)
{
    return std::make_pair(std::lower_bound(start, end, value),
                          std::upper_bound(start, end, value));
}
}

#endif /* BINARY_SEARCH_H */
