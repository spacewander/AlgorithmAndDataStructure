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

    it('removeIf', function()
        local ary = {1, 2, 3}
        Algos.removeIf(ary, function (v)
            return v < 2
        end)
        assert.are.same({2, 3}, ary)
    end)
end)
