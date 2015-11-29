-- copy if not existed
function copy(src, dest)
    for k, v in pairs(src) do
        if dest[k] == nil then dest[k] = v end
    end
end

-- copy if the value in src is ok
function copyIf(src, dest, func)
    for k, v in pairs(src) do
        if func(v) and dest[k] == nil then dest[k] = v end
    end
end

function copyN(dest, n, value)
    for i = 1, n do dest[i] = value end
end

-- return the index copy starts. If copy fails. return 0
function copyBackward(src, dest)
    local gap = #dest - #src
    if gap < 0 then return 0 end
    for i = 1, #src do dest[i + gap] = src[i] end
    return gap + 1
end

function fill(table, value)
    for k, _ in pairs(table) do
        table[k] = value
    end
end

function fillN(seq, n, value)
    for i = 1, #seq do
        if i <= n then seq[i] = value end
    end
end

function transform(table, func)
    for k, v in pairs(table) do
        table[k] = func(v)
    end
end

function generate(table, func)
    for k, _ in pairs(table) do
        table[k] = func()
    end
end

function generateN(seq, n, func)
    for i = 1, #seq do
        if i <= n then seq[i] = func() end
    end
end

function removeIf(t, func)
    for k, _ in pairs(t) do
        if func(k) then table.remove(t, k) end
    end
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
    removeIf = removeIf,
}
