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

TEST_F(Sorting, partial_sort_copy)
{
    // case: outEnd - outStart >= end - start
    vector<int> v2(2);
    my::partial_sort_copy(v.begin(), v.begin() + 2, 
            v2.begin(), v2.end(), less<int>());
    EXPECT_EQ(5, v2[0]);
    EXPECT_EQ(20, v2[1]);

    // case: end - start >= outEnd - outStart
    vector<int> v3(2);
    my::partial_sort_copy(v.begin(), v.begin() + 3,
            v3.begin(), v3.end(), less<int>());
    EXPECT_EQ(4, v3[0]);
    EXPECT_EQ(5, v3[1]);
}

TEST_F(Sorting, nth_element)
{
    // case : nth - start < (end - start) / 2
    my::nth_element(v.begin(), std::next(v.begin(), 2), v.end(), 
            greater<int>());
    EXPECT_EQ(190, v[0]);
    EXPECT_EQ(20, v[1]);


    // case : nth - start >= (end - start) / 2
    my::nth_element(v.begin(), std::next(v.begin(), 3), v.end(), 
            greater<int>());
    EXPECT_EQ(190, v[0]);
    EXPECT_EQ(20, v[1]);
}
