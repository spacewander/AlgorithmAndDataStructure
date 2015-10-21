#ifndef SORTING_H
#define SORTING_H

#include <algorithm>

namespace my {

template<typename ForwardIt, typename Compare>
bool is_sorted(ForwardIt start, ForwardIt end, Compare cp)
{
    return std::is_sorted_until(start, end, cp) == end;
}

template<typename ForwardIt, typename Compare>
ForwardIt is_sorted_until(ForwardIt start, ForwardIt end, Compare cp)
{
    using namespace std::placeholders;
    ForwardIt it = std::adjacent_find(start, end, std::bind(cp, _2, _1));
    return it == end ? end : std::next(it);
}

// Quick sort
template<typename RandomIt, typename Compare>
void sort(RandomIt start, RandomIt end, Compare cp)
{
    if (std::distance(start, end) <= 1) 
        return;
    RandomIt pivot = std::next(start, std::distance(start, end) / 2);
    RandomIt e = std::prev(end);
    std::iter_swap(pivot, e);
    RandomIt j = start;
    for (RandomIt i = start; i != e; ++i) {
        if (cp(*i, *e)) {
            std::iter_swap(j, i);
            ++j;
        }
    }
    std::iter_swap(e, j);
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

template<typename RandomIt, typename Compare>
RandomIt quick_select(RandomIt left, RandomIt right, RandomIt border, 
        Compare cp)
{
    std::iter_swap(border, right);
    RandomIt storeIdx = left;
    for (RandomIt i = left; i != right; ++i) {
        if (cp(*i, *right)) {
            std::iter_swap(storeIdx, i);
            ++storeIdx;
        }
    }
    std::iter_swap(right, storeIdx);
    return storeIdx;
}

template<typename RandomIt, typename Compare>
void nth_element(RandomIt start, RandomIt nth, RandomIt end, Compare cp)
{
    RandomIt left = start;
    RandomIt right = std::prev(end);
    while (left < nth && nth < right) {
        RandomIt border = quick_select(left, right, nth, cp);
        if (border == nth)
            break;
        if (border < nth) {
            left = border;
        }
        else {
            right = border;
        }
    }
}

}

#endif /* SORTING_H */
