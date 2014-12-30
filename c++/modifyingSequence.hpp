#ifndef MODIFYINGSEQUENCE_H
#define MODIFYINGSEQUENCE_H

#include <algorithm>
#include <random>

namespace my {

template<typename InputIt, typename OutputIt>
OutputIt copy(InputIt start, InputIt end, OutputIt outStart)
{
    while (start != end) {
        *outStart++ = *start++;
    }
    return outStart;
}

template<typename InputIt, typename OutputIt, typename UnaryPredicate>
OutputIt copy_if(InputIt start, InputIt end, OutputIt outStart, 
        UnaryPredicate f)
{
    while (start != end) {
        if (f(*start)) {
            *outStart++ = *start;
        }
        start++;
    }
    return outStart;
}

template<typename InputIt, typename OutputIt>
OutputIt copy_n(InputIt start, const int count, OutputIt result)
{
    for (int i = 0; i < count; ++i) {
        *result++ = *start++;
    }
    return result;
}

template<typename BidirIt1, typename BidirIt2>
BidirIt2 copy_backward(BidirIt1 start, BidirIt1 end, BidirIt2 outEnd)
{
    while (start != end) {
        *(--outEnd) = *(--end);
    }
    return outEnd;
}

// std::move is defined in <utility> and isn't an algorithm, 
// so there is no cheat.
template<typename InputIt, typename OutputIt>
OutputIt move(InputIt start, InputIt end, OutputIt outStart)
{
    while (start != end) {
        *outStart++ = std::move(*start++);
    }
    return outStart;
}

template<typename BidirIt1, typename BidirIt2>
BidirIt2 move_backward(BidirIt1 start, BidirIt1 end, BidirIt2 outEnd)
{
    while (start != end) {
        *(--outEnd) = std::move(*(--end));
    }
    return outEnd;
}

template<typename ForwordIt, typename T>
void fill(ForwordIt start, ForwordIt end, const T &value)
{
    while (start != end) {
        *start++ = value;
    }
}

template<typename OutputIt, typename T>
void fill_n(OutputIt start, const int count, const T &value)
{
    for (int i = 0; i < count; ++i) {
        *start++ = value;
    }
}
    
template<typename InputIt, typename OutputIt, typename UnaryOperation>
OutputIt transform(InputIt start, InputIt end, OutputIt outStart, 
        UnaryOperation op)
{
    while (start != end) {
        *outStart++ = op(*start++);
    }
    return outStart;
}

template<typename ForwordIt, typename Generator>
void generate(ForwordIt start, ForwordIt end, Generator g)
{
    while (start != end) {
        *start++ = g();
    }
}

template<typename OutputIt, typename Generator>
void generate_n(OutputIt start, const int count, Generator g)
{
    for (int i = 0; i < count; ++i) {
        *start++ = g();
    }
}

template<typename ForwordIt, typename T>
ForwordIt remove(ForwordIt start, ForwordIt end, const T& match)
{
    if ((start = std::find(start, end, match)) != end) {
        for (ForwordIt i = start; i != end; ++i) {
            if (!(*i == match)) {
                *start++ = std::move(*i);
            }
        }
    }
    return start;
}

template<typename ForwordIt, typename UnaryPredicate>
ForwordIt remove_if(ForwordIt start, ForwordIt end, UnaryPredicate f)
{
    if ((start = std::find_if(start, end, f)) != end) {
        for (ForwordIt i = std::next(start); i != end; ++i) {
            if (!f(*i)) {
                *start++ = std::move(*i);
            }
        }
    }
    return start;
}

template<typename InputIt, typename OutputIt, typename T>
OutputIt remove_copy(InputIt start, InputIt end, OutputIt outStart, 
                     const T &match)
{
    for (; start != end; ++start) {
        if (!(*start == match)) {
            *outStart++ = *start;
        }
    }
    return outStart;
}

template<typename InputIt, typename OutputIt, typename UnaryPredicate>
OutputIt remove_copy_if(InputIt start, InputIt end, OutputIt outStart,
                        UnaryPredicate f)
{
    for (; start != end; ++start) {
        if (!f(*start)) {
            *outStart++ = *start;
        }
    }
    return outStart;
}

template<typename ForwordIt, typename T>
void replace(ForwordIt start, ForwordIt end, const T &before, const T &after)
{
    for (; start != end; ++start) {
        if (*start == before) {
            *start = after;
        }
    }
}

template<typename ForwordIt, typename UnaryPredicate, typename T>
void replace_if(ForwordIt start, ForwordIt end, UnaryPredicate f, 
                const T &after)
{
    for (; start != end; ++start) {
        if (f(*start)) {
            *start = after;
        }
    }
}

template<typename InputIt, typename OutputIt, typename T>
OutputIt replace_copy(InputIt start, InputIt end, OutputIt outStart, 
                      const T &before, const T &after)
{
    for (; start != end; ++start) {
        *outStart++ = (*start == before) ? after : *start;
    }
    return outStart;
}

template<typename InputIt, typename OutputIt, 
         typename UnaryPredicate, typename T>
OutputIt replace_copy_if(InputIt start, InputIt end, OutputIt outStart,
                         UnaryPredicate f, const T &after)
{
    for (; start != end; ++start) {
        *outStart++ = f(*start) ? after : *start;
    }
    return outStart;
}

template<typename T>
void swap(T &a, T &b)
{
    T tmp(a);
    a = std::move(b);
    b = std::move(tmp);
}

template<typename ForwordIt1, typename ForwordIt2>
ForwordIt2 swap_ranges(ForwordIt1 start1, ForwordIt1 end1, ForwordIt2 start2)
{
    while (start1 != end1) {
        std::iter_swap(start1++, start2++);
    }
    return start2;
}

template<typename ForwordIt1, typename ForwordIt2>
void iter_swap(ForwordIt1 a, ForwordIt2 b)
{
    std::swap(*a, *b);
}

template<typename BidirIt>
void reverse(BidirIt start, BidirIt end)
{
    while ((start != end) && (start != --end)) {
        std::iter_swap(start++, end);
    }
}

template<typename BidirIt, typename OutputIt>
OutputIt reverse_copy(BidirIt start, BidirIt end, OutputIt outStart)
{
    while (start != end) {
        *(outStart++) = *(--end);
    }
    return outStart;
}

template<typename ForwordIt>
void rotate(ForwordIt start, ForwordIt newStart, ForwordIt end)
{
    ForwordIt newPlace = newStart;
    while (start != newPlace) {
        std::iter_swap(start++, newPlace++);
        if (newPlace == end) {
            newPlace = newStart;
        }
        else if (start == newStart) {
            newStart = newPlace;
        }
    }
}

template<typename ForwordIt, typename OutputIt>
OutputIt rotate_copy(ForwordIt start, ForwordIt newStart, 
                     ForwordIt end, OutputIt outStart)
{
    outStart = std::copy(newStart, end, outStart);
    return std::copy(start, newStart, outStart);
}

template<typename RandomIt>
void shuffle(RandomIt start, RandomIt end)
{
    auto n = end - start;
    std::random_device rd;
    for (int i = n - 1; i > 0; --i) {
        int randomNum = rd() % n;
        std::swap(*(start + i), *(start + randomNum));
    }
}

template<typename ForwordIt>
ForwordIt unique(ForwordIt start, ForwordIt end)
{
    if (start == end) {
        return end;
    }
    ForwordIt result = start;
    while (++start != end) {
        if (!(*result == *start)) {
            *(++result) = *start;
        }
    }
    return ++result;
}

template<typename ForwordIt, typename OutputIt>
OutputIt unique_copy(ForwordIt start, ForwordIt end, OutputIt outStart)
{
    if (start == end) {
        return outStart;
    }
    *outStart = *start;
    for (ForwordIt head = start++;start != end;++start) {
        if (!(*head == *start)) {
            *(++outStart) = *start;
            head = start;
        }
    }
    return ++outStart;
}

}
#endif /* MODIFYINGSEQUENCE_H */
