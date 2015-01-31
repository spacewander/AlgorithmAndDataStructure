#ifndef HEAP_H
#define HEAP_H

#include <algorithm>

namespace my {

template<typename RandomIt, typename Compare>
void sort_heap(RandomIt start, RandomIt end, Compare cp)
{
    while (start != end)
        std::pop_heap(start, end--, cp);
}

template<typename RandomIt>
bool is_heap(RandomIt start, RandomIt end)
{
    if (start == end) return true;
    for (RandomIt cur = start + 1; cur != end; ++cur)
        if (!(*cur < *(cur - (cur - start) / 2 - 1))) return false;
    return true;
}

template<typename RandomIt>
RandomIt is_heap_until(RandomIt start, RandomIt end)
{
    if (start == end) return end;
    for (RandomIt cur = start + 1; cur != end; ++cur)
        if (!(*cur < *(cur - (cur - start) / 2 - 1))) return cur;
    return end;
}

template<typename RandomIt>
void push_heap(RandomIt start, RandomIt end)
{
    if (start == end) return;
    for (RandomIt cur = end - 1; cur != start;) {
        RandomIt parent = cur - (cur - start) / 2 - 1;
        if (*cur < *parent) return;
        std::iter_swap(cur, parent);
        cur = parent;
    }
}

template<typename RandomIt>
void make_heap(RandomIt start, RandomIt end)
{
    if (start == end || start + 1 == end) return;
    RandomIt cur = start + (end - start) / 2 - 1;
    while (cur >= start) {
        while (true) {
            RandomIt left = start + (cur - start) * 2 + 1;
            if (left >= end) break;
            RandomIt right = left + 1;
            RandomIt largest = *left > *cur ? left : cur;
            if (right <= end - 1)
                largest = *right > *largest ? right : largest;
            if (*largest != *cur) {
                std::iter_swap(cur, largest);
                cur = largest;
            }
            else
                break;
        }
        cur--;
    }
}

template<typename RandomIt>
void pop_heap(RandomIt start, RandomIt end)
{
    if (start == end || start + 1 == end) return;
    RandomIt sentinel = end - 1;
    std::iter_swap(start, sentinel);
    RandomIt largest, cur = start;
    while (true) {
        RandomIt left = start + (cur - start) * 2 + 1;
        if (left >= sentinel - 1) break;
        RandomIt right = left + 1;
        largest = *left > *cur ? left : cur;
        if (right < sentinel)
            largest = *right > *largest ? right : largest;
        if (*largest != *cur) {
            std::iter_swap(cur, largest);
            cur = largest;
        }
    }
}
}

#endif /* HEAP_H */
