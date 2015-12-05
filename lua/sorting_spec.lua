local Algos = require('./sorting')

describe('sorting algorithms', function()
    setup(function()
        ary = {1, 2, 3, 5, 2}
    end)

    it('is_sorted_until', function()
        assert.are.same(5, Algos.is_sorted_until(ary))
        local sorted_ary = {1, 2, 3}
        assert.are.same(#sorted_ary + 1, Algos.is_sorted_until(sorted_ary))
    end)

    it('is_sorted', function()
        assert.is_false(Algos.is_sorted(ary))
        local sorted_ary = {1, 2, 3}
        assert.is_true(Algos.is_sorted(sorted_ary))
    end)

    it('sort', function()
        local ary = {1, 2, 3, 5, 2}
        Algos.sort(ary)
        assert.are.same({1, 2, 2, 3, 5}, ary)
    end)

    it('partial_sort', function()
        local ary = {1, 2, 3, 5, 2}
        Algos.partial_sort(ary, 3)
        assert.are.same(1, ary[1])
        assert.are.same(2, ary[2])
        assert.are.same(2, ary[3])
    end)

    it('partial_sort_copy', function()
        local ary = {1, 2, 3, 5, 2}
        local ary2 = {1, 2, 3, 5, 2}
        local res = Algos.partial_sort_copy(ary, 3)
        assert.are.same(ary2, ary)
        assert.are.same({1, 2, 2}, res)
    end)

    it('stable_sort', function()
        local pair = {
            {1, 0},
            {2, 1},
            {2, 3},
            {2, 2},
            {1, 2},
            {3, 1},
        }
        Algos.stable_sort(pair, function (a, b)
            return a[1] < b[1]
        end)
        assert.are.same({
            {1, 0},
            {1, 2},
            {2, 1},
            {2, 3},
            {2, 2},
            {3, 1},
        }, pair)
    end)

    it('nth_element', function()
        assert.are.same(2, Algos.nth_element({1, 2, 3, 5, 2}, 3))
        assert.are.same(3, Algos.nth_element({1, 2, 3, 5, 2}, 4))
    end)
end)
