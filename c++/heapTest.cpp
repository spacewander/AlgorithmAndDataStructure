#include "test.h"
#include "heap.hpp"

using namespace std;

class Heap : public ::testing::Test
{
protected:
    vector<int> v{2, 3, 1, 4, 5};
};

TEST_F(Heap, sort_heap)
{
    vector<int> expected(v);
    std::make_heap(v.begin(), v.end());
    std::make_heap(expected.begin(), expected.end());
    std::sort_heap(expected.begin(), expected.end(), less<int>());
    my::sort_heap(v.begin(), v.end(), less<int>());
    EXPECT_EQ(expected, v);
}

TEST_F(Heap, is_heap)
{
    EXPECT_FALSE(my::is_heap(v.begin(), v.end()));
    std::make_heap(v.begin(), v.end());
    EXPECT_TRUE(my::is_heap(v.begin(), v.end()));
}

TEST_F(Heap, is_heap_until)
{
    EXPECT_EQ(std::is_heap_until(v.begin(), v.end()),
            my::is_heap_until(v.begin(), v.end()));
    std::make_heap(v.begin(), v.end());
    EXPECT_EQ(std::is_heap_until(v.begin(), v.end()),
            my::is_heap_until(v.begin(), v.end()));
}

TEST_F(Heap, make_heap)
{
    vector<int> duplicate = v;
    std::make_heap(duplicate.begin(), duplicate.end());
    my::make_heap(v.begin(), v.end());
    EXPECT_EQ(duplicate, v);
}

TEST_F(Heap, pop_heap)
{
    std::make_heap(v.begin(), v.end());
    vector<int> duplicate = v;
    std::pop_heap(duplicate.begin(), duplicate.end());
    my::pop_heap(v.begin(), v.end());
    EXPECT_EQ(duplicate, v);
}

TEST_F(Heap, push_heap)
{
    std::make_heap(v.begin(), v.end());
    v.push_back(11);
    EXPECT_FALSE(std::is_heap(v.begin(), v.end()));
    my::push_heap(v.begin(), v.end());
    EXPECT_TRUE(std::is_heap(v.begin(), v.end()));
}
