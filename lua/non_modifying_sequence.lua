local function allOf(seq, func)
    for i = 1, #seq do
        if not func(seq[i]) then return false end
    end
    return true
end

local function anyOf(seq, func)
    for i = 1, #seq do
        if func(seq[i]) then return true end
    end
    return false
end

local function noneOf(seq, func)
    return not anyOf(seq, func)
end

local function forEach(table, func)
    for _, v in pairs(table) do
        func(v)
    end
end

local function countIf(table, func)
    local count = 0
    for _, v in pairs(table) do
        if func(v) then count = count + 1 end
    end
    return count
end

local function count(table, match)
    return countIf(table, function(v)
        return v == match
    end)
end

local function mismatch(s1, s2)
    local min = #s1 > #s2 and #s2 or #s1
    for i = 1, min do
        if s1[i] ~= s2[i] then return i end
    end
    return min
end

local function equal(t1, t2)
    if #t1 ~= #t2 then return false end
    for k, v in pairs(t1) do
        if t2[k] ~= v then return false end
    end
    return true
end

-- use nil to indicate not found
local function findIf(table, func)
    for k, v in pairs(table) do
        if func(k, v) then return k end
    end
    return nil
end

local function findIfNot(table, func)
    for k, v in pairs(table) do
        if not func(k, v) then return k end
    end
    return nil
end

local function find(table, match)
    return findIf(table, function(k, v)
        return v == match
    end)
end

-- use 0 to indicate not found
local function index(seq, match, start)
    for i = start, #seq do
        if seq[i] == match then return i end
    end
    return 0
end

local function indexReversed(seq, match, endAt)
    for i = endAt, 1, -1 do
        if seq[i] == match then return i end
    end
    return 0
end

local function findEnd(seq, sub)
    if #sub == 0 then return 0 end
    local mismatch = false
    local start = indexReversed(seq, sub[#sub], #seq) - #sub
    while start >= 0 do -- if not found, start == -#sub
        for i = 1, #sub do
            if seq[start+i] ~= sub[i] then
                mismatch = true
                break
            end
        end
        if not mismatch then return start + 1 end
        start = indexReversed(seq, sub[#sub], start + #sub - 1) - #sub
    end
    return 0
end

local function findFirstOf(seq, sub)
    for i = 1, #sub do
        local met = index(seq, sub[i], 1)
        if met ~= 0 then return met end
    end
    return 0
end

local function search(seq, sub)
    if #sub == 0 then return 0 end
    local mismatch = false
    local start = index(seq, sub[1], 1)
    while start > 0 do
        for i = 1, #sub do
            if seq[start+i-1] ~= sub[i] then
                mismatch = true
                break
            end
        end
        if not mismatch then return start end
        start = index(seq, sub[1], start + 1)
    end
    return 0
end


local function searchN(seq, n, value)
    local sub = {}
    for i = 1, n do
        table.insert(sub, value)
    end
    return search(seq, sub)
end

return {
    allOf = allOf,
    anyOf = anyOf,
    noneOf = noneOf,
    forEach = forEach,
    count = count,
    countIf = countIf,
    mismatch = mismatch,
    equal = equal,
    find = find,
    findIf = findIf,
    findIfNot = findIfNot,
    findEnd = findEnd,
    findFirstOf = findFirstOf,
    search = search,
    searchN = searchN,
}
