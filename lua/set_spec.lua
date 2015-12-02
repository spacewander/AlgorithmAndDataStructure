local Algos = require('./set')

local ary1 = {1, 2, 3, 4}
local ary2 = {3, 4, 5, 6}

describe('set algorithms', function()
    it('merge', function()
        assert.are.same({1, 2, 3, 3, 4, 4, 5, 6}, Algos.merge(ary1, ary2))
    end)

    it('inplaceMerge', function()
        local ary = {1, 2, 3, 4}
        assert.are.same({1, 2, 3, 3, 4, 4, 5, 6}, Algos.inplaceMerge(ary, ary2))
    end)

    it('includes', function()
        assert.is_true(Algos.includes(ary1, {1, 2}))
        assert.is_false(Algos.includes(ary1, {5, 6}))
        assert.is_true(Algos.includes(ary1, {}))
    end)

    it('union', function()
        assert.are.same({1, 2, 3, 4, 5, 6}, Algos.union(ary1, ary2))
    end)

    it('difference', function()
        assert.are.same({1, 2}, Algos.difference(ary1, ary2))
    end)

    it('symmetricDifference', function()
        assert.are.same({1, 2, 5, 6}, Algos.symmetricDifference(ary1, ary2))
    end)

    it('intersection', function()
        assert.are.same({3, 4}, Algos.intersection(ary1, ary2))
    end)
end)
