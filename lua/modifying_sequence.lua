-- copy if not existed
local function copy(src, dest)
    for k, v in pairs(src) do
        if dest[k] == nil then dest[k] = v end
    end
end

-- copy if the value in src is ok
local function copyIf(src, dest, func)
    for k, v in pairs(src) do
        if func(v) and dest[k] == nil then dest[k] = v end
    end
end

local function copyN(dest, n, value)
    for i = 1, n do dest[i] = value end
end

-- return the index copy starts. If copy fails. return 0
local function copyBackward(src, dest)
    local gap = #dest - #src
    if gap < 0 then return 0 end
    for i = 1, #src do dest[i + gap] = src[i] end
    return gap + 1
end

local function fill(table, value)
    for k, _ in pairs(table) do
        table[k] = value
    end
end

local function fillN(seq, n, value)
    for i = 1, #seq do
        if i <= n then seq[i] = value end
    end
end

local function transform(table, func)
    for k, v in pairs(table) do
        table[k] = func(v)
    end
end

local function generate(table, func)
    for k, _ in pairs(table) do
        table[k] = func()
    end
end

local function generateN(seq, n, func)
    for i = 1, #seq do
        if i <= n then seq[i] = func() end
    end
end

local function removeIf(tb, func)
    for k, v in pairs(tb) do
        if func(k, v) then table.remove(tb, k) end
    end
end

local function remove(seq, value)
    removeIf(seq, function (k, v)
        return v == value
    end)
end

local function removeCopyIf(tb, func)
    local copy = {}
    for k, v in pairs(tb) do
        if func(k, v) then
            table.remove(tb, k)
            table.insert(copy, v)
        end
    end
    return copy
end

local function removeCopy(tb, value)
    return removeCopyIf(tb, function (k, v)
        return v == value
    end)
end

local function replaceIf(tb, func, after)
    for k, v in pairs(tb) do
        if func(k, v) then tb[k] = after end
    end
end

local function replace(tb, before, after)
    replaceIf(tb, function (k, v)
        return v == before
    end, after)
end

local function replaceCopyIf(tb, func, after)
    local copy = {}
    for k, v in pairs(tb) do
        if func(k, v) then
            copy[k] = after
        else
            copy[k] = v
        end
    end
    return copy
end

local function replaceCopy(tb, before, after)
    return replaceCopyIf(tb, function (k, v)
        return v == before
    end, after)
end

local function swapRange(a, b, startAt, endAt)
    if startAt < 0 or endAt > #a or endAt > #b then return end
    for i = startAt, endAt do
        a[i], b[i] = b[i], a[i]
    end
end

local function reverseRange(seq, startAt, endAt)
    for i = startAt, (endAt + startAt) / 2 do
        seq[i], seq[startAt+endAt-i] = seq[startAt+endAt-i], seq[i]
    end
end

local function reverse(seq)
    reverseRange(seq, 1, #seq)
end

local function reverseCopy(seq)
    local copy = {}
    for i = #seq, 1, -1 do
        copy[#seq-i+1] = seq[i]
    end
    return copy
end

local function shuffle(seq)
    for i = 1, #seq do
        local rd = math.floor(math.random() * i) + 1
        seq[rd], seq[i] = seq[i], seq[rd]
    end
end

-- assume 1 <= pivot <= #seq
local function rotate(seq, pivot)
    if #seq == 0 or pivot <= 1 then return end
    reverseRange(seq, 1, pivot-1)
    reverseRange(seq, pivot, #seq)
    reverseRange(seq, 1, #seq)
end

local function rotateCopy(seq, pivot)
    local copy = {}
    for i = pivot, #seq do
        table.insert(copy, seq[i])
    end
    for i = 1, pivot-1 do
        table.insert(copy, seq[i])
    end
    return copy
end

-- unique function only works on list-like table
local function unique(seq)
    local preValue = nil
    local i = 1
    for j = 1, #seq do
        if seq[j] ~= preValue then
            preValue = seq[j]
            seq[i] = preValue
            i = i + 1
        end
    end
    for j = i-1, #seq do
        table.remove(seq, j)
    end
end

local function uniqueCopy(seq)
    local copy = {}
    local preValue = nil
    local i = 1
    for j = 1, #seq do
        if seq[j] ~= preValue then
            preValue = seq[j]
            copy[i] = preValue
            i = i + 1
        end
    end
    return copy
end

return {
    copy = copy,
    copyIf = copyIf,
    copyN = copyN,
    copyBackward = copyBackward,
    -- move* is the same as copy*
    move = copy,
    moveBackward = copyBackward,
    fill = fill,
    fillN = fillN,
    transform = transform,
    generate = generate,
    generateN = generateN,
    remove = remove,
    removeIf = removeIf,
    removeCopy = removeCopy,
    removeCopyIf = removeCopyIf,
    replace = replace,
    replaceIf = replaceIf,
    replaceCopy = replaceCopy,
    replaceCopyIf = replaceCopyIf,
    swapRange = swapRange,
    reverse = reverse,
    reverseCopy = reverseCopy,
    shuffle = shuffle,
    rotate = rotate,
    rotateCopy = rotateCopy,
    unique = unique,
    uniqueCopy = uniqueCopy,
}
