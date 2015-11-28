local Algos = require('./numeric')

local ary = {1, 2, 3}

describe('numeric algorithms', function()
    it('itoa', function()
        local g = Algos.itoa(3)
        assert.are.same(3, g())
        assert.are.same(4, g())
    end)

    it('accumulate', function()
        assert.are.same(1, Algos.accumulate({}, 1, function(x, y)
            return x * y
        end))
        assert.are.same(6, Algos.accumulate(ary, 1, function(x, y)
            return x * y
        end))
    end)

    it('innerProduction', function()
        assert.are.same(1, Algos.innerProduction({}, {}, 1))
        assert.are.same(14, Algos.innerProduction(ary, ary, 0))
    end)

    it('adjacentDifference', function()
        assert.are.same({}, Algos.adjacentDifference({}))
        assert.are.same({1, 1, 1}, Algos.adjacentDifference(ary))
    end)

    it('partialSum', function()
        assert.are.same({}, Algos.partialSum({}))
        assert.are.same({1, 3, 6}, Algos.partialSum(ary))
    end)
end)
