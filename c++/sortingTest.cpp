#include "test.h"
#include "sorting.hpp"

using namespace std;

class Sorting : public ::testing::Test
{
protected:
    vector<int> v{20, 5, 4, 3, 10, 190};
    vector<int> sortedVec{1, 2, 3, 4};
};

TEST_F(Sorting, is_sorteds)
{
    EXPECT_TRUE(my::is_sorted(sortedVec.begin(), sortedVec.end(), 
                less<int>()));
    auto it = my::is_sorted_until(sortedVec.begin(), sortedVec.end(), 
            less<int>());
    EXPECT_EQ(sortedVec.end(), it);
}

TEST_F(Sorting, sort)
{
    my::sort(v.begin(), v.end(), greater<int>());
    vector<int> sortedV{190, 20, 10, 5, 4, 3};
    EXPECT_EQ(sortedV, v);
}

TEST_F(Sorting, stable_sort)
{
    vector<pair<int, int> > pairVec{
        make_pair(8, 20),
        make_pair(10, 9),
        make_pair(10, 10),
        make_pair(20, 10),
        make_pair(10, 11),
        make_pair(8, 10)
    };
    my::stable_sort(pairVec.begin(), pairVec.end(), 
        [](const pair<int, int> &a, const pair<int, int> &b){ 
            return a.first < b.first;
        });
    EXPECT_EQ(make_pair(8, 20), pairVec[0]);
    EXPECT_EQ(make_pair(8, 10), pairVec[1]);
    EXPECT_EQ(make_pair(10, 9), pairVec[2]);
    EXPECT_EQ(make_pair(10, 10), pairVec[3]);
    EXPECT_EQ(make_pair(10, 11), pairVec[4]);
}

TEST_F(Sorting, partial_sort)
{
    my::partial_sort(v.begin(), v.begin() + 2, v.end(), less<int>());
    EXPECT_EQ(3, v[0]);
    EXPECT_EQ(4, v[1]);
}
