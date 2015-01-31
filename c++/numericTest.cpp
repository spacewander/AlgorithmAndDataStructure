#include "test.h"
#include "numeric.hpp"

using namespace std;

class Numeric : public ::testing::Test
{
protected:
    vector<int> v{1, 2, 3, 4};
};

TEST_F(Numeric, itoa)
{
    my::itoa(v.begin(), v.end(), 3);
    vector<int> res{3, 4, 5, 6};
    EXPECT_EQ(res, v);
}

TEST_F(Numeric, accumulate)
{
    int res = my::accumulate(v.begin(), v.end(), 1, std::multiplies<int>());
    EXPECT_EQ(24, res);
}

TEST_F(Numeric, inner_product)
{
    int res = my::inner_product(v.begin(), v.end(), v.begin(), 0);
    EXPECT_EQ(30, res);
}

TEST_F(Numeric, adjacent_difference)
{
    vector<int> res;
    vector<int> diff{1, 1, 1, 1};
    my::adjacent_difference(v.begin(), v.end(), back_inserter(res));
    EXPECT_EQ(diff, res);
}

TEST_F(Numeric, partial_sum)
{
    vector<int> res;
    vector<int> sum{1, 3, 6, 10};
    my::partial_sum(v.begin(), v.end(), back_inserter(res));
    EXPECT_EQ(sum, res);
}
