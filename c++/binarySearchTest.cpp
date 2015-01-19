#include "test.h"
#include "binarySearch.hpp"

using namespace std;

class BinarySearch : public ::testing::Test
{
protected:
    vector<int> v{1, 2, 4, 8, 16};
};

TEST_F(BinarySearch, lower_bound)
{
    auto lower = my::lower_bound(v.begin(), v.end(), 4);
    EXPECT_EQ(4, *lower);

    lower = my::lower_bound(v.begin(), v.end(), 1);
    EXPECT_EQ(1, *lower);
}

TEST_F(BinarySearch, upper_bound)
{
    auto upper = my::upper_bound(v.begin(), v.end(), 4);
    EXPECT_EQ(8, *upper);

    upper = my::upper_bound(v.begin(), v.end(), 16);
    EXPECT_EQ(v.end(), upper);
}

TEST_F(BinarySearch, binary_search)
{
    EXPECT_TRUE(my::binary_search(v.begin(), v.end(), 4, less<int>()));
    EXPECT_FALSE(my::binary_search(v.begin(), v.end(), 0, less<int>()));
}

TEST_F(BinarySearch, equal_range)
{
    auto pivot = my::equal_range(v.begin(), v.end(), 4);
    EXPECT_EQ(4, *(pivot.first));
    EXPECT_EQ(8, *(pivot.second));

    auto start = my::equal_range(v.begin(), v.end(), 0);
    EXPECT_EQ(v.begin(), start.first);
    auto last = my::equal_range(v.begin(), v.end(), 17);
    EXPECT_EQ(v.end(), last.second);
}
