#ifndef NUMERIC_H
#define NUMERIC_H

#include <algorithm>

namespace my {

template<typename ForwordIt, typename T>
void itoa(ForwordIt start, ForwordIt end, T v)
{
    while (start != end) {
        *start++ = v;
        ++v;
    }
}

template<typename InputIt, typename T, typename BinaryOperation>
T accumulate(InputIt start, InputIt end, T init, BinaryOperation op)
{
    while (start != end) {
        init = op(init, *start);
        ++start;
    }
    return init;
}

template<typename InputIt1, typename InputIt2, typename T>
T inner_product(InputIt1 start1, InputIt1 end1, InputIt2 start2, T v)
{
    while (start1 != end1) {
        v = v + *start1 * *start2;
        ++start1;
        ++start2;
    }
    return v;
}

template<typename InputIt, typename OutputIt>
OutputIt adjacent_difference(InputIt start, InputIt end, OutputIt outStart)
{
    if (start == end) return outStart;
    using T = typename std::iterator_traits<InputIt>::value_type;
    T diff = *start;
    *outStart = diff;
    while (++start != end) {
        T v = *start;
        outStart++;
        *outStart = v - diff;
        diff = std::move(v);
    }
    return ++outStart;
}

template<typename InputIt, typename OutputIt>
OutputIt partial_sum(InputIt start, InputIt end, OutputIt outStart)
{
    if (start == end) return outStart;
    using T = typename std::iterator_traits<InputIt>::value_type;
    T sum = *start;
    *outStart = sum;
    while (++start != end) {
        sum += *start;
        outStart++;
        *outStart = sum;
    }
    return ++outStart;
}
}

#endif /* NUMERIC_H */
