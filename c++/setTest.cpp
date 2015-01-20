#include "test.h"
#include "set.hpp"

using namespace std;

class Set : public ::testing::Test
{
protected:
    vector<int> a{1, 2, 3, 4};
    vector<int> b{3, 4, 5, 6};
};

TEST_F(Set, merge)
{
    vector<int> c(a.size() + b.size());
    my::merge(a.begin(), a.end(), b.begin(), b.end(), c.begin());
    vector<int> ab{1, 2, 3, 3, 4, 4, 5, 6};
    EXPECT_EQ(ab, c);
}

TEST_F(Set, inplace_merge)
{
    vector<pair<int, int> > pairs{
        make_pair(8, 20),
        make_pair(10, 9),
        make_pair(10, 10),
        make_pair(8, 10),
        make_pair(10, 11),
        make_pair(20, 10),
    };

    vector<pair<int, int> > merged = pairs;
    auto cp = [](const pair<int, int> &a, const pair<int, int> &b){ 
            return a.first < b.first;
    };
    my::inplace_merge(pairs.begin(), pairs.begin() + 3, pairs.end(), cp);
    std::inplace_merge(merged.begin(), merged.begin() + 3, merged.end(), cp);
    EXPECT_EQ(merged, pairs);
}

TEST_F(Set, includes)
{
    EXPECT_FALSE(my::includes(a.begin(), a.end(), 
                b.begin(), b.end(), less<int>()));
    vector<int> c{1, 2};
    EXPECT_TRUE(my::includes(a.begin(), a.end(),
                c.begin(), c.end(), less<int>()));
}

TEST_F(Set, set_difference)
{
    vector<int> c(2);
    my::set_difference(a.begin(), a.end(), b.begin(), b.end(), c.begin());
    vector<int> diff{1, 2};
    EXPECT_EQ(diff, c);
}

TEST_F(Set, set_intersection)
{
    vector<int> c(2);
    my::set_intersection(a.begin(), a.end(), b.begin(), b.end(), c.begin());
    vector<int> intersection{3, 4};
    EXPECT_EQ(intersection, c);
}
