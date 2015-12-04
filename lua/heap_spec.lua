local Algos = require('./heap')

describe('heap algorithms', function()
    setup(function()
        ary = {2, 3, 1, 4, 5}
    end)

    it('is_heap', function()
        assert.is_false(Algos.is_heap(ary))
        assert.is_true(Algos.is_heap({1, 2, 3, 4, 5}))
        assert.is_true(Algos.is_heap({1, 3, 2, 5, 4}))
    end)

    it('is_heap_until', function()
        assert.are.same(3, Algos.is_heap_until(ary))
        local ary2 = {1, 2, 3, 4, 5}
        assert.are.same(#ary2+1, Algos.is_heap_until(ary2))
    end)

    it('make_heap', function()
        assert.is_false(Algos.is_heap(ary))
        Algos.make_heap(ary, function (a, b)
            return a < b
        end)
        assert.is_true(Algos.is_heap(ary))
    end)

    it('pop_heap', function()
        local heap = {1, 3, 2, 5, 4}
        assert.are.same(1, Algos.pop_heap(heap, function (a, b)
            return a < b
        end))
        assert.are.same(4, #heap)
        assert.is_true(Algos.is_heap(heap))
    end)

    it('push_heap', function()
        local ary = {1, 2, 5, 4}
        Algos.push_heap(ary, 3, function (a, b)
            return a < b
        end)
        assert.is_true(Algos.is_heap(ary))
    end)

    it('sort_heap', function()
        Algos.sort_heap(ary, function (a, b)
            return a < b
        end)
        assert.are.same({1, 2, 3, 4, 5}, ary)
    end)
end)
