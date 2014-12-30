#include <algorithm>
#include <vector>
#include <functional>
#include <iterator>

#include "../lib/gtest.h"
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
    vector<int> v2{ *prev(v.end()) };
    auto findFirstOf = my::find_first_of(v.begin(), v.end(), 
            v2.begin(), v2.end(), equal_to<int>());
    auto stdFindFirstOf = find_first_of(v.begin(), v.end(), 
            v2.begin(), v2.end(), equal_to<int>());
    ASSERT_EQ(stdFindFirstOf, findFirstOf);
}

TEST_F(NonModifyingSequence, adjacent_find)
{
    v.push_back(*prev(v.end()));
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

    v.push_back(*prev(v.end()));
    bool has_2 = my::search_n(v.begin(), v.end(), 2, 
            *prev(v.end()), equal_to<int>()) != v.end();
    bool has_3 = my::search_n(v.begin(), v.end(), 3, 
            *prev(v.end()), equal_to<int>()) != v.end();
    ASSERT_TRUE(has_2);
    ASSERT_FALSE(has_3);
}

class ModifyingSequence : public ::testing::Test
{
protected:
    virtual void SetUp()
    {
        v2.resize(v.size());
    }
    vector<int> v{10, 5, 4, 3, 20, 190};
    vector<int> v2;
};

TEST_F(ModifyingSequence, copys)
{
    my::copy(v.begin(), v.end(), v2.begin());
    ASSERT_EQ(v[0], v2[0]);

    v2.clear();
    my::copy_if(v.begin(), v.end(), back_inserter(v2), 
            [](int x){ return x > 5; });
    ASSERT_EQ(3, v2.size());
    ASSERT_EQ(v[0], v2[0]);

    v2.clear();
    my::copy_n(v.begin(), 2, back_inserter(v2));
    ASSERT_EQ(2, v2.size());
    ASSERT_EQ(v[1], v2[1]);
    ASSERT_EQ(v[0], v2[0]);

    v2.resize(v.size());
    my::copy_backward(v.begin(), v.end(), v2.end());
    ASSERT_EQ(v, v2);
}

TEST_F(ModifyingSequence, moves)
{
    my::move(v.begin(), v.end(), v2.begin());
    ASSERT_EQ(v[0], v2[0]);

    --v2[0];
    my::move_backward(v.begin(), v.end(), v2.end());
    ASSERT_EQ(v, v2);
}

TEST_F(ModifyingSequence, fills)
{
    my::fill(v2.begin(), v2.end(), 1);
    ASSERT_EQ(1, v2[0]);
    ASSERT_EQ(1, *prev(v2.end()));

    my::fill_n(v2.begin(), 2, 2);
    ASSERT_EQ(2, v2[0]);
    ASSERT_EQ(2, v2[1]);
}

TEST_F(ModifyingSequence, transform)
{
    my::transform(v.begin(), v.end(), v.begin(), [](int &x){ return ++x; });
    vector<int> vectorplusOne{11, 6, 5, 4, 21, 191};
    ASSERT_EQ(vectorplusOne, v);
}

TEST_F(ModifyingSequence, generates)
{
    my::generate(v2.begin(), v2.end(), [](){ return 1; });
    ASSERT_EQ(1, v2[0]);
    ASSERT_EQ(1, *prev(v2.end()));

    my::generate_n(v2.begin(), 2, [](){ return 2; });
    ASSERT_EQ(2, v2[0]);
    ASSERT_EQ(2, v2[1]);
}

TEST_F(ModifyingSequence, removes)
{
    v.erase(my::remove(v.begin(), v.end(), 5), v.end());
    ASSERT_EQ(5, v.size());

    v.erase(my::remove_if(v.begin(), v.end(), 
                [](int x){ return x > 10; }), v.end());
    ASSERT_EQ(3, v.size());

    v2.clear();
    my::remove_copy(v.begin(), v.end(), back_inserter(v2), 10);
    ASSERT_EQ(2, v2.size());
    ASSERT_EQ(v2.end(), find(v2.begin(), v2.end(), 10));

    my::remove_copy_if(v.begin(), v.end(), back_inserter(v2), 
            [](int x){ return x != 10; });
    ASSERT_EQ(3, v2.size());
    ASSERT_EQ(prev(v2.end()), find(v2.begin(), v2.end(), 10));
}

TEST_F(ModifyingSequence, replaces)
{
    my::replace(v.begin(), v.end(), 10, 11);
    ASSERT_EQ(11, v[0]);
    my::replace(v.begin(), v.end(), 190, 10);
    ASSERT_EQ(10, *prev(v.end()));

    my::replace_if(v.begin(), v.end(), [](int x){ return x > 5; }, 5);
    const int fives = count(v.begin(), v.end(), 5);
    ASSERT_EQ(4, fives);
}

TEST_F(ModifyingSequence, replace_copys)
{
    my::replace_copy(v.begin(), v.end(), v2.begin(), 5, 6);
    ASSERT_EQ(v2.end(), find(v2.begin(), v2.end(), 5));
    ASSERT_EQ(++v2.begin(), find(v2.begin(), v2.end(), 6));

    v2.clear();
    my::replace_copy_if(v.begin(), v.end(), back_inserter(v2),
            [](int x){ return x > 10; }, 10);
    const int tens = count(v2.begin(), v2.end(), 10);
    ASSERT_EQ(3, tens);
    ASSERT_EQ(v2.end(), find(v2.begin(), v2.end(), 190));
}

TEST_F(ModifyingSequence, swaps)
{
    vector<int> replicaV(v);
    vector<int> replicaV2(v2);
    my::swap(v, v2);
    ASSERT_EQ(replicaV, v2);
    ASSERT_EQ(replicaV2, v);

    // make sure v.size() == v2.size()
    my::swap_ranges(v.begin(), v.end(), v2.begin());
    ASSERT_EQ(replicaV, v);
    ASSERT_EQ(replicaV2, v2);

    auto vIt = v.begin();
    auto v2It = v2.begin();
    while (vIt != v.end()) {
        my::iter_swap(vIt++, v2It++);
    }
    ASSERT_EQ(replicaV2, v);
    ASSERT_EQ(replicaV, v2);
}
