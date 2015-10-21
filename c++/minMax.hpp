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

template<typename ForwardIt>
ForwardIt max_element(ForwardIt start, ForwardIt end)
{
    if (start == end) return end;
    ForwardIt largest = start;
    ++start;
    for (; start != end; ++start) {
        if (*largest < *start)
            largest = start;
    }
    return largest;
}

template<typename ForwardIt>
ForwardIt min_element(ForwardIt start, ForwardIt end)
{
    if (start == end) return end;
    ForwardIt smallest = start;
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

template<typename ForwardIt>
std::pair<ForwardIt, ForwardIt> minmax_element(ForwardIt start, ForwardIt end)
{
    std::pair<ForwardIt, ForwardIt> result(start, start);
    if (start == end) return result;
    while (++start != end) {
        if (*start < *result.first)
            result.first = start;
        if (*start >= *result.second)
            result.second = start;
    }
    return result;
}

// only work on ascii
template<typename InputIt1, typename InputIt2>
bool lexicographical_compare(InputIt1 start1, InputIt1 end1,
        InputIt2 start2, InputIt2 end2)
{
    for (; start1 != end1 && start2 != end2; ++start1, ++start2) {
        if (*start2 > *start1) return true;
        if (*start2 < *start1) return false;
    }
    return start1 == end1 && start2 != end2;
}

template<typename ForwardIt1, typename ForwardIt2>
bool is_permutation(ForwardIt1 start1, ForwardIt1 end1,
        ForwardIt2 start2, ForwardIt2 end2)
{
   if (std::distance(start1, end1) != std::distance(start2, end2))
       return false;
   std::tie(start1, start2) = std::mismatch(start1, end1, start2);
   if (start1 != end1) {
       for (ForwardIt1 i = start1; i != end1; ++i) {
           if (i != std::find(start1, i, *i))
               continue;
           size_t match = std::count(start2, end2, *i);
           if (match == 0 || match != std::count(i, end1, *i))
               return false;
       }
   }
   return true;
}

template<typename BidirIt>
bool next_permutation(BidirIt start, BidirIt end)
{
    if (start == end || start + 1 == end) return false;
    BidirIt i = std::prev(end);
    while (true) {
        BidirIt i1 = i, i2;
        if (*--i < *i1) {
            i2 = std::prev(end);
            while (!(*i < *i2))
                --i2;
            std::iter_swap(i, i2);
            std::reverse(i1, end);
            return true;
        }
        if (i == start) {
            std::reverse(start, end);
            return false;
        }
    }
}

template<typename BidirIt>
bool prev_permutation(BidirIt start, BidirIt end)
{
    if (start == end || start + 1 == end) return false;
    BidirIt i = std::prev(end);
    while (true) {
        BidirIt i1 = i, i2;
        if (*i1 < *--i) {
            i2 = std::prev(end);
            while (!(*i2 < *i))
                --i2;
            std::iter_swap(i, i2);
            std::reverse(i1, end);
            return true;
        }
        if (i == start) {
            std::reverse(start, end);
            return false;
        }
    }
}
}

#endif /* MINMAX_H */
