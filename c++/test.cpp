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

TEST_F(NonModifyingSequence, find)
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
    auto findFirstOf = find_first_of(v.begin(), v.end(), 
            v2.begin(), v2.end(), equal_to<int>());
    auto stdFindFirstOf = find_first_of(v.begin(), v.end(), 
            v2.begin(), v2.end(), equal_to<int>());
    ASSERT_EQ(stdFindFirstOf, findFirstOf);
}
