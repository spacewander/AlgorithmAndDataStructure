#include <string>

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

TEST_F(MinMax, lexicographical_compare)
{
    string a = "abcd";
    string b = "abce";
    EXPECT_TRUE(my::lexicographical_compare(a.begin(), a.end(),
                b.begin(), b.end()));
}

TEST_F(MinMax, is_permutation)
{
    vector<int> a{1, 2, 3, 4, 5};
    vector<int> b{1, 2, 3, 4, 4};
    EXPECT_TRUE(my::is_permutation(v.begin(), v.end(), a.begin(), a.end()));
    EXPECT_FALSE(my::is_permutation(v.begin(), v.end(), b.begin(), b.end()));
}

TEST_F(MinMax, next_permutation)
{
    vector<int> duplicate(v);
    EXPECT_TRUE(my::next_permutation(v.begin(), v.end()));
    std::next_permutation(duplicate.begin(), duplicate.end());
    EXPECT_EQ(duplicate, v);
}

TEST_F(MinMax, prev_permutation)
{
    vector<int> duplicate(v);
    EXPECT_TRUE(my::prev_permutation(v.begin(), v.end()));
    std::prev_permutation(duplicate.begin(), duplicate.end());
    EXPECT_EQ(duplicate, v);
}
