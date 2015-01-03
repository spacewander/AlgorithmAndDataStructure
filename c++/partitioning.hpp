#ifndef PARTITIONING_H
#define PARTITIONING_H

#include <algorithm>

namespace my {
    
template<typename InputIt, typename UnaryPredicate>
bool is_partitioned(InputIt start, InputIt end, UnaryPredicate f)
{
    for (; start != end; ++start) {
        if (!f(*start)) break;
    }
    for (; start != end; ++start) {
        if (f(*start)) {
            return false;
        }
    }
    return true;
}

// true elements group is ahead of false elements group
template<typename ForwordIt, typename UnaryPredicate>
ForwordIt partition(ForwordIt start, ForwordIt end, UnaryPredicate f)
{
    while (start != end && f(*start)) {
        ++start;
    }
    for (ForwordIt pioneer = start;pioneer != end; ++pioneer) {
        if (f(*pioneer)) {
            std::iter_swap(start, pioneer);
            ++start;
        }
    }
    return start;
}

template<typename InputIt, typename OutputIt1, 
    typename OutputIt2, typename UnaryPredicate>
std::pair<OutputIt1, OutputIt2>
    partition_copy(InputIt start, InputIt end, OutputIt1 outTrue, 
            OutputIt2 outFalse, UnaryPredicate f)
{
    for (;start != end; ++start) {
        if (f(*start)) {
            *outTrue++ = *start;
        }
        else {
            *outFalse++ = *start;
        }
    }
    return std::make_pair(outTrue, outFalse);
}

template<typename BidirIt, typename UnaryPredicate>
BidirIt stable_partition(BidirIt start, BidirIt end, UnaryPredicate f)
{
    while (start != end && f(*start)) {
        ++start;
    }
    for (BidirIt pioneer = start;pioneer != end; ++pioneer) {
        if (f(*pioneer)) {
            std::iter_swap(start, pioneer);
            ++start;
            BidirIt follower = pioneer;
            while (follower != start) {
                std::iter_swap(follower, --follower);
            }
        }
    }
    return start;
}

template<typename ForwordIt, typename UnaryPredicate>
ForwordIt partition_point(ForwordIt start, ForwordIt end, UnaryPredicate f)
{
    while (start != end) {
        if (!f(*start)) {
            ++start;
            break;
        }
    }
    return start;
}
}

#endif /* PARTITIONING_H */
