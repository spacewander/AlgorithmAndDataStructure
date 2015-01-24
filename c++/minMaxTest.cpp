#include "test.h"
#include "minMax.hpp"

using namespace std;

class MinMax : public ::testing::Test
{
protected:
    vector<int> v{2, 3, 1, 4, 5};
};

TEST_F(MinMax, max)
{
    EXPECT_EQ(3, my::max(2, 3));
    EXPECT_EQ(3, my::max(3, 2));
}

TEST_F(MinMax, min)
{
    EXPECT_EQ(3, my::min(4, 3));
    EXPECT_EQ(3, my::min(3, 4));
}

TEST_F(MinMax, max_element)
{
    EXPECT_EQ(5, *my::max_element(v.begin(), v.end()));
}

TEST_F(MinMax, min_element)
{
    EXPECT_EQ(1, *my::min_element(v.begin(), v.end()));
}

TEST_F(MinMax, minmax)
{
    // first is min, second is max
    EXPECT_EQ(1, my::minmax(3, 1).first);
    EXPECT_EQ(3, my::minmax(3, 1).second);
}

TEST_F(MinMax, minmax_element)
{
    EXPECT_EQ(1, *my::minmax_element(v.begin(), v.end()).first);
    EXPECT_EQ(5, *my::minmax_element(v.begin(), v.end()).second);
}
