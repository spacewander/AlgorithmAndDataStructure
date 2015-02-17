#include "test.h"
#include "modifyingSequence.hpp"

using namespace std;

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

TEST_F(ModifyingSequence, reverse)
{
    vector<int> reversed{190, 20, 3, 4, 5, 10};
    my::reverse(v.begin(), v.end());
    ASSERT_EQ(reversed, v);
    reverse(reversed.begin(), reversed.end());
    my::reverse_copy(v.begin(), v.end(), v2.begin());
    ASSERT_EQ(reversed, v2);
}

TEST_F(ModifyingSequence, rotates)
{
    int ary[5] = { 1, 2, 3, 4, 5 };
    vector<int> rotatedAry{ 3, 4, 5, 1, 2 };
    vector<int> rotatedAry2{1, 2, 3, 4, 5 };
    my::rotate(ary, ary + 2, ary + 5);
    vector<int> tmp(ary, ary + 5);
    my::rotate(ary, ary + 3, ary + 5);
    vector<int> tmp2(ary, ary + 5);

    ASSERT_EQ(rotatedAry, tmp);
    ASSERT_EQ(rotatedAry2, tmp2);

    auto pivot = next(v.begin(), 3);
    my::rotate_copy(v.begin(), pivot, v.end(), v2.begin());
    vector<int> rotatedV{ 3, 20, 190, 10, 5, 4 };
    ASSERT_EQ(rotatedV, v2);
}

TEST_F(ModifyingSequence, shuffle)
{
    vector<int> replicaV(v);
    my::shuffle(v.begin(), v.end());
    ASSERT_TRUE(is_permutation(v.begin(), v.end(), replicaV.begin()));
}

TEST_F(ModifyingSequence, uniques)
{
    unsigned int size = v.size();
    // there is not duplicate value in v before
    v.push_back(v.back());
    v.erase(my::unique(v.begin(), v.end()), v.end());
    ASSERT_EQ(size, v.size());

    vector<int> duplicate{ 1, 1, 2, 2, 3 };
    vector<int> uniqueness{ 1, 2, 3 };
    vector<int> tmp;
    my::unique_copy(duplicate.begin(), duplicate.end(), 
            back_inserter(tmp));
    ASSERT_EQ(uniqueness, tmp);
}
