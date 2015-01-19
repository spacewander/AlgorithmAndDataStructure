#ifndef SORTING_H
#define SORTING_H

#include <algorithm>
#include <stdlib.h>

namespace my {

template<typename ForwordIt, typename Compare>
bool is_sorted(ForwordIt start, ForwordIt end, Compare cp)
{
    return std::is_sorted_until(start, end, cp) == end;
}

template<typename ForwordIt, typename Compare>
ForwordIt is_sorted_until(ForwordIt start, ForwordIt end, Compare cp)
{
    using namespace std::placeholders;
    ForwordIt it = std::adjacent_find(start, end, std::bind(cp, _2, _1));
    return it == end ? end : std::next(it);
}

// Quick sort
template<typename RandomIt, typename Compare>
void sort(RandomIt start, RandomIt end, Compare cp)
{
    if (std::distance(start, end) <= 1) 
        return;
    using T = typename std::iterator_traits<RandomIt>::value_type;
    RandomIt pivot = std::next(start, std::distance(start, end) / 2);
    T x = *pivot;
    std::iter_swap(pivot, std::prev(end));
    RandomIt j = start;
    for (RandomIt i = start, e = std::prev(end); i != e; ++i) {
        if (cp(*i, x)) {
            std::iter_swap(j, i);
            ++j;
        }
    }
    std::iter_swap(std::prev(end), j);
    my::sort(start, j, cp);
    my::sort(j + 1, end, cp);
}

// Insert sort. A quick sort implementation is possible, but more difficult. 
template<typename RandomIt, typename Compare>
void stable_sort(RandomIt start, RandomIt end, Compare cp)
{
    using T = typename std::iterator_traits<RandomIt>::value_type;
    if (start != end) {
        for (RandomIt i = std::next(start); i != end; ++i) {
            RandomIt j = i;
            T v = std::move(*j);
            for (RandomIt k = i; k != start && cp(v, *--k); --j)
                *j = std::move(*k);
            *j = std::move(v);
        }
    }
}

template<typename RandomIt, typename Compare>
void partial_sort(RandomIt start, RandomIt border, RandomIt end, Compare cp)
{
    std::make_heap(start, border);
    for (RandomIt i = border; i < end; ++i) {
        if (cp(*i, *start)) {
            std::iter_swap(start, i);
            std::pop_heap(start, border, cp);
        }
    }
    std::sort_heap(start, border, cp);
}

template<typename InputIt, typename RandomIt, typename Compare>
void partial_sort_copy(InputIt start, InputIt end,
        RandomIt outStart, RandomIt outEnd, Compare cp)
{
    size_t outRange = std::distance(outStart, outEnd);
    size_t inRange = std::distance(start, end);
    if (inRange <= outRange) {
        std::copy(start, end, outStart);
        std::partial_sort(outStart, outStart + inRange, outEnd, cp);
    }
    else {
        using T = typename std::iterator_traits<RandomIt>::value_type;
        T* space = new T[inRange];
        std::copy(start, end, space);
        std::partial_sort(space, space + inRange, space + outRange, cp);
        std::copy(space, space + outRange, outStart);
        delete[] space;
    }
}

// FIXME: this is a bad implementation!
template<typename RandomIt, typename Compare>
void nth_element(RandomIt start, RandomIt nth, RandomIt end, Compare cp)
{
    if (nth == end)
        return ;
    if (nth - start < (end - start) / 2 ) {
        for (RandomIt i = start; i <= nth; i++) {
            std::iter_swap(i, std::min_element(i, end, cp));
        }
    }   
    else {
        for (RandomIt i = end - 1; i >= nth; i--) {
            std::iter_swap(i, std::max_element(start, i + 1, cp));
        }
    }

}

}

#endif /* SORTING_H */
