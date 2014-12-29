#include <algorithm>
#include <vector>
#include <functional>

#include "gtest.h"
#include "myalgorithm.hpp"

using namespace std;

class NonModifyingSequence : public ::testing::Test 
{
protected:
  vector<int> v{10, 5, 4, 3, 20, 190};
};

TEST(Algorithm, testifWorks)
{ 
    ASSERT_EQ(2, 1 + 1);
}

TEST_F(NonModifyingSequence, all_of)
{
    bool allOf = my::all_of(v.begin(), v.end(), [](int x){ return x == 5; });
    ASSERT_FALSE(allOf);
}

TEST_F(NonModifyingSequence, any_of)
{
    bool anyOf = my::any_of(v.begin(), v.end(), [](int x){ return x == 5; });
    ASSERT_TRUE(anyOf);
}

TEST_F(NonModifyingSequence, none_of)
{
    bool noneOf = my::none_of(v.begin(), v.end(), 
            [](int x){ return x < 0; });
    ASSERT_TRUE(noneOf);
}

TEST_F(NonModifyingSequence, for_each)
{
    int a = v[0], b = v[1];
    my::for_each(v.begin(), v.end(), [](int &x){ ++x; });
    ASSERT_EQ(a + 1, v[0]);
    ASSERT_EQ(b + 1, v[1]);
}

TEST_F(NonModifyingSequence, count)
{
    unsigned int numOfElementsEqual5 = my::count(v.begin(), v.end(), 5);
    unsigned int numOfElementsGreater5 = my::count_if(v.begin(), v.end(), 
            [](int x){ return x > 5; });
    ASSERT_EQ(1, numOfElementsEqual5);
    ASSERT_EQ(3, numOfElementsGreater5);
}

TEST_F(NonModifyingSequence, mismatch)
{
    vector<int> v2{ v[0], v[1], v[2] };
    auto pair = my::mismatch(v.begin(), v.end(), v2.begin(), equal_to<int>());
    ASSERT_EQ(3, *(pair.first));
}

TEST_F(NonModifyingSequence, equal)
{
    vector<int> v2(v);
    vector<int> v3;
    ASSERT_TRUE(my::equal(v.begin(), v.end(), 
                v2.begin(), v2.end(), equal_to<int>()));
    ASSERT_FALSE(my::equal(v.begin(), v.end(), 
                v3.begin(), v3.end(), equal_to<int>()));
}

TEST_F(NonModifyingSequence, finds)
{
    auto notFound = my::find(v.begin(), v.end(), 999);
    ASSERT_EQ(v.end(), notFound);

    auto findIt = my::find(v.begin(), v.end(), 5);
    auto stdFindIt = find(v.begin(), v.end(), 5);
    ASSERT_EQ(stdFindIt, findIt);

    auto findItIf = my::find_if(v.begin(), v.end(), 
                bind(greater<int>(), placeholders::_1, 5));
    auto stdFindItIf = find_if(v.begin(), v.end(), bind(
                greater<int>(), placeholders::_1, 5));
    ASSERT_EQ(stdFindItIf, findItIf);

    auto findItIfNot = my::find_if_not(v.begin(), v.end(), 
            [](int i){ return i <= 5; });
    auto stdFindItIfNot = find_if_not(v.begin(), v.end(), 
            [](int i){ return i <= 5; });
    ASSERT_EQ(stdFindItIfNot, findItIfNot);
}

TEST_F(NonModifyingSequence, find_end)
{
    vector<int> v2{ v[0], v[1], v[2] };
    auto findEnd = my::find_end(v.begin(), v.end(), 
            v2.begin(), v2.end(), equal_to<int>());
    auto stdFindEnd = find_end(v.begin(), v.end(), 
            v2.begin(), v2.end(), equal_to<int>());
    ASSERT_EQ(stdFindEnd, findEnd);
}

TEST_F(NonModifyingSequence, find_first_of)
{
    vector<int> v2{ v.at(v.size() - 1) };
    auto findFirstOf = my::find_first_of(v.begin(), v.end(), 
            v2.begin(), v2.end(), equal_to<int>());
    auto stdFindFirstOf = find_first_of(v.begin(), v.end(), 
            v2.begin(), v2.end(), equal_to<int>());
    ASSERT_EQ(stdFindFirstOf, findFirstOf);
}

TEST_F(NonModifyingSequence, adjacent_find)
{
    v.push_back(*(v.end() - 1));
    auto adjacentFind = my::adjacent_find(v.begin(), v.end(), equal_to<int>());
    auto stdAdjacentFind = adjacent_find(v.begin(), v.end(), equal_to<int>());
    ASSERT_EQ(stdAdjacentFind, adjacentFind);
}

TEST_F(NonModifyingSequence, searchs)
{
    vector<int> v2{ v[1], v[2] };
    auto search = my::search(v.begin(), v.end(), 
            v2.begin(), v2.end(), equal_to<int>());
    ASSERT_EQ(v[1], *search);

    v.push_back(*(v.end() - 1));
    bool has_2 = my::search_n(v.begin(), v.end(), 2, 
            *(v.end() - 1), equal_to<int>()) != v.end();
    bool has_3 = my::search_n(v.begin(), v.end(), 3, 
            *(v.end() - 1), equal_to<int>()) != v.end();
    ASSERT_TRUE(has_2);
    ASSERT_FALSE(has_3);
}
