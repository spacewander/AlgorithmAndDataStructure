#ifndef BINARY_SEARCH_H
#define BINARY_SEARCH_H

#include <algorithm>

namespace my {

// return iterator points to the first element which is not less than value
template<typename ForwardIt, typename T>
ForwardIt lower_bound(ForwardIt start, ForwardIt end, const T& value)
{
    ForwardIt it;
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

// return iterator points to the first element which is greater than value
template<typename ForwardIt, typename T>
ForwardIt upper_bound(ForwardIt start, ForwardIt end, const T& value)
{
    ForwardIt it;
    size_t count = std::distance(start, end);
    size_t step;
    while (count > 0) {
        it = start;
        step = count / 2;
        std::advance(it, step);
        if (*it <= value) {
            start = ++it;
            count -= step + 1;
        }
        else
            count = step;
    }
    return start;
}

template<typename ForwardIt, typename T, typename Compare>
bool binary_search(ForwardIt start, ForwardIt end, const T& value, Compare cp)
{
    start = std::lower_bound(start, end, value, cp);
    return !(start == end) && !cp(value, *start);
}

template<typename ForwardIt, typename T>
std::pair<ForwardIt, ForwardIt> equal_range(ForwardIt start, ForwardIt end, 
        const T& value)
{
    return std::make_pair(std::lower_bound(start, end, value),
                          std::upper_bound(start, end, value));
}
}

#endif /* BINARY_SEARCH_H */
