local Algos = require('./binary_search')

local ary = {1, 2, 3, 4}
describe('Binary search algorithms', function()
    
    it('lowerBound', function()
        assert.are.same(Algos.lowerBound(ary, 3), 3)
        assert.are.same(Algos.lowerBound(ary, 2.5), 3)
        assert.are.same(Algos.lowerBound(ary, 1), 1)
        assert.are.same(Algos.lowerBound(ary, 5), 5)
    end)

    it('upperBound', function()
        assert.are.same(Algos.upperBound(ary, 3), 4)
        assert.are.same(Algos.upperBound(ary, 2.5), 3)
        assert.are.same(Algos.upperBound(ary, 4), 5)
    end)

    it('binarySearch', function()
        assert.is_true(Algos.binarySearch(ary, 3))
        assert.is_false(Algos.binarySearch(ary, 0))
        assert.is_false(Algos.binarySearch(ary, 5))
    end)

    it('equalRange', function()
        local lower_a, upper_a = Algos.equalRange(ary, 3)
        assert.are.same(lower_a, 3)
        assert.are.same(upper_a, 4)
        local lower_b, upper_b = Algos.equalRange(ary, 2.5)
        assert.are.same(lower_b, 3)
        assert.are.same(upper_b, 3)
    end)
end)
