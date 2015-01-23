#ifndef SET_H
#define SET_H

#include <algorithm>

namespace my {

template<typename InputIt1, typename InputIt2, typename OutputIt>
OutputIt merge(InputIt1 start1, InputIt1 end1, InputIt2 start2, InputIt2 end2,
        OutputIt outStart)
{
    for (; start1 != end1; ++outStart) {
        if (start2 == end2)
            return std::copy(start1, end1, outStart);
        if (*start2 < *start1) {
            *outStart = *start2;
            ++start2;
        }
        else {
            *outStart = *start1;
            ++start1;
        }
    }
    return std::copy(start2, end2, outStart);
}

// make sure (mid - start) + (end - mid) == end - start
template<typename BidirIt, typename Compare>
void inplace_merge(BidirIt start, BidirIt mid, BidirIt end, Compare cp)
{
    BidirIt start1 = start;
    BidirIt start2 = mid;
    using T = typename std::iterator_traits<BidirIt>::value_type;
    T* space = new T[std::distance(start, end)];
    int i = 0;
    for (;start1 != mid || start2 != end; ++i) {
        if (start1 != mid && (start2 == end || !cp(*start2, *start1))) {
            space[i] = std::move(*start1);
            ++start1;
        }
        else {
            space[i] = std::move(*start2);
            ++start2;
        }
    }
    std::copy(space, space + i, start);
    delete[] space;
}

// both [start1, end1) and [start2, end2) are sorted
template<typename InputIt1, typename InputIt2, typename Compare>
bool includes(InputIt1 start1, InputIt1 end1, 
        InputIt2 start2, InputIt2 end2, Compare cp)
{
    for (; start2 != end2; ++start1) {
        if (start1 == end1 || cp(*start2, *start1))
            return false;
        if (!cp(*start1, *start2))
            ++start2;
    }
    return true;
}

template<typename InputIt1, typename InputIt2, typename OutputIt>
OutputIt set_difference(InputIt1 start1, InputIt1 end1, 
        InputIt2 start2, InputIt2 end2, OutputIt outStart)
{
    while (start1 != end1) {
        if (start2 == end2)
            return std::copy(start1, end1, outStart);
        if (*start1 < *start2) {
            *outStart++ = *start1++;
        }
        else {
            if (!(*start2 < *start1))
                ++start1;
            ++start2;
        }
    }
    return outStart;
}

template<typename InputIt1, typename InputIt2, typename OutputIt>
OutputIt set_intersection(InputIt1 start1, InputIt1 end1,
        InputIt2 start2, InputIt2 end2, OutputIt outStart)
{
    while (start1 != end1 && start2 != end2) {
        if (*start1 < *start2) {
            ++start1;
        }
        else {
            if (!(*start2 < *start1))
                *outStart++ = *start1++;
            ++start2;
        }
    }
    return outStart;
}

template<typename InputIt1, typename InputIt2, typename OutputIt>
OutputIt set_symmetric_difference(InputIt1 start1, InputIt1 end1,
        InputIt2 start2, InputIt2 end2, OutputIt outStart)
{
    while (start1 != end1) {
        if (start2 == end2)
            return std::copy(start1, end1, outStart);
        if (*start1 < *start2) {
            *outStart++ = *start1++;
        }
        else {
            if (*start2 < *start1)
                *outStart++ = *outStart;
            else
                ++start1;
            ++start2;
        }
    }
    return std::copy(start2, end2, outStart);
}

template<typename InputIt1, typename InputIt2, typename OutputIt>
OutputIt set_union(InputIt1 start1, InputIt1 end1,
        InputIt2 start2, InputIt2 end2, OutputIt outStart)
{
    while (start1 != end1) {
        if (start2 == end2)
            return std::copy(start1, end1, outStart);
        if (*start2 < *start1) {
            *outStart++ = *start2++;
        }
        else {
            *outStart++ = *start1;
            if (!(*start1 < *start2))
                ++start2;
            ++start1;
        }
    }
    return std::copy(start2, end2, outStart);
}
}

#endif /* SET_H */
