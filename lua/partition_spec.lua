local Algos = require('./partition')

local seq
local function less_than_3(num)
    return num < 3
end

describe('partition algorithms', function()
    setup(function ()
        seq = {1, 2, 3, 5, 2}
    end)

    it('is_partitioned', function()
        assert.is_false(Algos.is_partitioned(seq, less_than_3))
        assert.is_true(Algos.is_partitioned({2, 1, 2}, less_than_3))
    end)

    it('partition_point', function()
        assert.are.same(3, Algos.partition_point(seq, less_than_3))
        assert.are.same(4, Algos.partition_point({2, 1, 2}, less_than_3))
    end)

    it('partition', function()
        local seq = {1, 2, 4, 2}
        Algos.partition(seq, less_than_3)
        assert.are.same(4, seq[4])
    end)

    it('partition_copy', function()
        local copy = Algos.partition_copy(seq, less_than_3)
        assert.are.same(3, copy[4])
    end)

    it('stable_partition', function()
        local seq = {1, 2, 3, 1, 2, 5, 4}
        Algos.stable_partition(seq, less_than_3)
        assert.are.same({1, 2, 1, 2, 3, 5, 4}, seq)
    end)
end)
