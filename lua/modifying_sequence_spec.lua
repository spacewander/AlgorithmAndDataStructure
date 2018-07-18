local Algos = require('./modifying_sequence')
local ary = {1, 2, 3, 4, 5}
local table = {a = 1, b = 2}

describe('modifying sequence algorithms', function()
    it('copy', function()
        local dest = {}
        Algos.copy(table, dest)
        assert.are.same(table, dest)
    end)

    it('copyIf', function()
        local dest = {}
        Algos.copyIf(table, dest, function (v)
            return v == 1
        end)
        assert.are.same({a = 1}, dest)
    end)

    it('copyN', function()
        local dest = {}
        Algos.copyN(dest, 3, 3)
        assert.are.same({3, 3, 3}, dest)
    end)

    it('copyBackward', function()
        local dest = {1, 1, 1}
        assert.are.same(0, Algos.copyBackward(ary, dest))

        dest = {1, 1, 1, 1, 1}
        assert.are.same(1, Algos.copyBackward(ary, dest))
        assert.are.same({1, 2, 3, 4, 5}, dest)

        dest = {1, 1, 1, 1, 1, 1}
        assert.are.same(2, Algos.copyBackward(ary, dest))
        assert.are.same({1, 1, 2, 3, 4, 5}, dest)
    end)

    it('fill', function()
        local dest = {1, 1, 1}
        Algos.fill(dest, 3)
        assert.are.same({3, 3, 3}, dest)
    end)

    it('fillN', function()
        local dest = {1, 1, 1}
        Algos.fillN(dest, 2, 3)
        assert.are.same({3, 3, 1}, dest)
    end)

    it('transform', function()
        local ary = {1, 2, 3, 4, 5}
        Algos.transform(ary, function (v)
            return v + 1
        end)
        assert.are.same({2, 3, 4, 5, 6}, ary)
    end)

    it('generate', function()
        local dest = {1, 1, 1}
        Algos.generate(dest, function ()
            return 3
        end)
        assert.are.same({3, 3, 3}, dest)
    end)

    it('generateN', function()
        local dest = {1, 1, 1}
        Algos.generateN(dest, 2, function ()
            return 3
        end)
        assert.are.same({3, 3, 1}, dest)
    end)

    it('remove', function()
        local ary = {1, 2, 3}
        Algos.remove(ary, 3)
        assert.are.same({1, 2}, ary)
    end)

    it('removeIf', function()
        local ary = {1, 2, 3}
        Algos.removeIf(ary, function (k, v)
            return v < 2
        end)
        assert.are.same({2, 3}, ary)
    end)

    it('removeCopy', function()
        local ary = {1, 2, 3}
        assert.are.same({3}, Algos.removeCopy(ary, 3))
    end)

    it('removeCopyIf', function()
        local ary = {1, 2, 3}
        ary = Algos.removeCopyIf(ary, function (k, v)
            return v < 2
        end)
        assert.are.same({1}, ary)
    end)

    it('replace', function()
        local ary = {1, 2, 3, 3}
        Algos.replace(ary, 3, 2)
        assert.are.same({1, 2, 2, 2}, ary)
    end)

    it('replaceIf', function()
        local ary = {1, 2, 3}
        Algos.replaceIf(ary, function (k, v)
            return v < 2
        end, 2)
        assert.are.same({2, 2, 3}, ary)
    end)

    it('replaceCopy', function()
        local ary = {1, 2, 3, 3}
        ary = Algos.replaceCopy(ary, 3, 2)
        assert.are.same({1, 2, 2, 2}, ary)
    end)

    it('replaceCopyIf', function()
        local ary = {1, 2, 3}
        ary = Algos.replaceCopyIf(ary, function (k, v)
            return v < 2
        end, 2)
        assert.are.same({2, 2, 3}, ary)
    end)

    it('swapRange', function()
        local a = {1, 2, 3, 4}
        local b = {4, 3, 2, 1}
        -- unlike other implementation,
        -- the range here is double side closed([start, end])
        Algos.swapRange(a, b, 1, 3)
        assert.are.same({4, 3, 2, 4}, a)
        assert.are.same({1, 2, 3, 1}, b)
    end)

    it('reverse', function()
        local ary = {1, 2, 3}
        Algos.reverse(ary)
        assert.are.same({3, 2, 1}, ary)
    end)

    it('reverseCopy', function()
        local ary1 = {1, 2, 3}
        local ary2 = {3, 2, 1}
        assert.are.same(ary2, Algos.reverseCopy(ary1))
    end)

    it('shuffle', function()
        Algos.shuffle({1, 2, 3})
        Algos.shuffle({1, 2, 3, 4})
    end)

    it('rotate', function()
        local ary = {1, 2, 3, 4}
        Algos.rotate(ary, 3)
        assert.are.same({3, 4, 1, 2}, ary)
    end)

    it('rotateCopy', function()
        assert.are.same({3, 4, 5, 1, 2}, Algos.rotateCopy(ary, 3))
    end)

    it('unique', function()
        local duplicate = {1, 1, 2, 3, 3}
        Algos.unique(duplicate)
        assert.are.same({1, 2, 3}, duplicate)
    end)

    it('uniqueCopy', function()
        local duplicate = {1, 2, 2, 3}
        assert.are.same({1, 2, 3}, Algos.uniqueCopy(duplicate))
    end)
end)
