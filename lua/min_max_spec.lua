local Algos = require('./min_max')

local ary = {2, 3, 1, 4, 5}

describe('min/max algorithms', function()
    it('min', function()
        assert.are.same(Algos.min(2, 3), 2)
    end)

    it('max', function()
        assert.are.same(Algos.max(2, 3), 3)
    end)

    it('minmax', function()
        local min, max = Algos.minmax(2, 3)
        assert.are.same(min, 2)
        assert.are.same(max, 3)
    end)

    it('maxElement', function()
        assert.are.same(Algos.maxElement(ary), 5)
    end)

    it('minElement', function()
        assert.are.same(Algos.minElement(ary), 1)
    end)

    it('minmaxElement', function()
        local min, max = Algos.minmaxElement(ary)
        assert.are.same(min, 1)
        assert.are.same(max, 5)
    end)

    it('lexicographicalCompare', function()
        local a = 'abcd'
        local b = 'abce'
        local c = 'abced'
        assert.is_true(Algos.lexicographicalCompare(a, b))
        assert.is_true(Algos.lexicographicalCompare(b, c))
        assert.is_false(Algos.lexicographicalCompare(c, b))
    end)

    it('isPermutation', function()
        assert.is_true(Algos.isPermutation(ary, {1, 2, 3, 4, 5}))
        assert.is_false(Algos.isPermutation(ary, {1, 2, 3, 4, 4}))
        assert.is_false(Algos.isPermutation(ary, {1, 2, 3, 4}))
    end)

    it('nextPermutation', function()
        local list = {2, 3, 1, 4, 5}
        -- permutate table in-place
        Algos.nextPermutation(list)
        assert.are.same(list, {2, 3, 1, 5, 4})
    end)

    it('prevPermutation', function()
        local list = {2, 3, 1, 4, 5}
        -- assume nextPermutation is correct
        Algos.nextPermutation(list)
        Algos.prevPermutation(list)
        assert.are.same(list, {2, 3, 1, 4, 5})
    end)
end)
