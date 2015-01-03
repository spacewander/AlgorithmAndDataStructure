#include <forward_list>
#include "test.h"
#include "partitioning.hpp"

using namespace std;

class Partitioning : public ::testing::Test
{
protected:
    vector<int> v{20, 5, 4, 3, 10, 190};
    vector<int> v2;
};

TEST_F(Partitioning, is_partitioned)
{
    bool is_partitioned = my::is_partitioned(v.begin(), v.end(), 
            [](int x){ return x < 20; });
    EXPECT_FALSE(is_partitioned);
}

TEST_F(Partitioning, partition)
{
    auto pivot = my::partition(v.begin(), v.end(), [](int x){ return x < 20; });
    copy(pivot, v.end(), back_inserter(v2));
    bool is_partitioned = all_of(v2.begin(), v2.end(), 
            [](int x){ return x < 20; });
    EXPECT_FALSE(is_partitioned);

    forward_list<int> fl = {1, 30, -4, 1, 6, -8, 2, -5, 64, 1, 92};
    auto pivot2 = my::partition(fl.begin(), fl.end(), 
            [](int x){ return x < 0; });
    forward_list<int> fl2;
    copy(fl.begin(), pivot2, front_inserter(fl2));
    is_partitioned = all_of(fl2.begin(), fl2.end(), 
            [](int x){ return x < 0; });
    EXPECT_TRUE(is_partitioned);
}

TEST_F(Partitioning, partition_copy)
{
    vector<int> trueVec{5, 4, 3};
    vector<int> falseVec{20, 10, 190};
    vector<int> v3;

    my::partition_copy(v.begin(), v.end(), back_inserter(v2), 
            back_inserter(v3), [](int x){ return x < 10; });
    EXPECT_EQ(v2, trueVec);
    EXPECT_EQ(v3, falseVec);
}

TEST_F(Partitioning, stable_partition)
{
    vector<int> before{ 20, 10, 5, 4, 3, 1, 2 };
    vector<int> after{ 20, 10, 4, 2, 5, 3, 1 };
    my::stable_partition(before.begin(), before.end(), 
            [](int x){ return x % 2 == 0; });
    EXPECT_EQ(after, before);

    vector<int> before2{ 10, 2, 5, 4, 1, 3, 20 };
    vector<int> after2{ 10, 2, 4, 20, 5, 1, 3 };
    my::stable_partition(before2.begin(), before2.end(), 
            [](int x){ return x % 2 == 0; });
    EXPECT_EQ(after2, before2);
}

TEST_F(Partitioning, partition_point)
{
    auto it = my::partition_point(v.begin(), v.end(), 
            [](int x){ return x < 10; });
    EXPECT_EQ(5, *it);
}
