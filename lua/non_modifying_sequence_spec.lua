local Algos = require('./non_modifying_sequence')
local ary = {1, 2, 3, 4, 5}

describe('non-modifying sequence algorithms', function()
    it('allOf', function()
        assert.is_false(Algos.allOf(ary, function(v)
            return v < 3
        end))
    end)

    it('anyOf', function()
        assert.is_true(Algos.anyOf(ary, function(v)
            return v < 3
        end))
    end)

    it('noneOf', function()
        assert.is_false(Algos.noneOf(ary, function(v)
            return v < 3
        end))
    end)

    it('forEach', function()
        local emptyAry = {}
        Algos.forEach(ary, function(v)
            table.insert(emptyAry, v+1)
        end)
        assert.are.same({2, 3, 4, 5, 6}, emptyAry)
    end)

    it('count', function()
        assert.are.same(1, Algos.count(ary, 3))
    end)

    it('countIf', function()
        assert.are.same(2, Algos.countIf(ary, function(v)
            return v < 3
        end))
    end)

    it('mismatch', function()
        local ary2 = {1, 3, 4}
        assert.are.same(2, Algos.mismatch(ary, ary2))
    end)

    it('equal', function()
        assert.is_true(Algos.equal({1, 2, 3, 4, 5}, ary))
    end)

    it('find', function()
        assert.are.same(nil, Algos.find({2, 1}, 3))
        assert.are.same(2, Algos.find({2, 1}, 1))
        assert.are.same('a', Algos.find({a = 1, b = 2}, 1))
    end)

    it('findIf', function()
        assert.are.same(1, Algos.findIf({0, 1}, function (k, v)
            return v <= 1
        end))
        assert.are.same('a', Algos.findIf({a = 1, b = 2}, function (k, v)
            return v == 1
        end))
    end)

    it('findIfNot', function()
        assert.are.same('a', Algos.findIfNot({a = 1, b = 2}, function (k, v)
            return v ~= 1
        end))
    end)

    it('findEnd', function()
        local ary = {1, 2, 1, 2, 3}
        local sub = {1, 2}
        local nonExistedSub = {2, 4}
        assert.are.same(3, Algos.findEnd(ary, {1}))
        assert.are.same(4, Algos.findEnd(ary, {2}))
        assert.are.same(3, Algos.findEnd(ary, sub))
        assert.are.same(0, Algos.findEnd(ary, nonExistedSub))
    end)

    it('findFirstOf', function()
        assert.are.same(2, Algos.findFirstOf(ary, {10, 2, 3}))
        assert.are.same(0, Algos.findFirstOf(ary, {10, 20}))
    end)

    it('search', function()
        assert.are.same(3, Algos.search(ary, {3, 4}))
        assert.are.same(0, Algos.search(ary, {3, 4, 2}))
    end)

    it('searchN', function()
        assert.are.same(0, Algos.searchN(ary, 2, 3))
        assert.are.same(3, Algos.searchN(ary, 1, 3))
    end)
end)
