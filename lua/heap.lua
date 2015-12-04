function is_heap(seq)
    for i = 2, #seq do
        if seq[i] < seq[math.floor(i/2)] then return false end
    end
    return true
end

function is_heap_until(seq)
    for i = 2, #seq do
        if seq[i] < seq[math.floor(i/2)] then return i end
    end
    return #seq + 1
end

-- min heap
function make_heap(seq, func)
    for i = math.floor(#seq/2), 1, -1 do
        while true do
            local left = 2 * i
            if left > #seq then break end
            local smallest = func(seq[left], seq[i]) and left or i
            local right = left + 1
            if right <= #seq then
                smallest = func(seq[right], seq[smallest]) and right or smallest
            end
            if seq[smallest] ~= seq[i] then
                seq[smallest], seq[i] = seq[i], seq[smallest]
                i = smallest
            else
                break
            end
        end
    end
end

function pop_heap(seq, func)
    local tmp = seq[1]
    table.remove(seq, 1)
    make_heap(seq, func)
    return tmp
end

function push_heap(seq, value, func)
    table.insert(seq, value)
    make_heap(seq, func)
end

function sort_heap(seq, func)
    make_heap(seq, func)
    local tmp = {}
    for i = 1, #seq do
        table.insert(tmp, pop_heap(seq, func))
    end
    for i = 1, #tmp do
        table.insert(seq, tmp[i])
    end
end

return {
    is_heap = is_heap,
    is_heap_until = is_heap_until,
    make_heap = make_heap,
    pop_heap = pop_heap,
    push_heap = push_heap,
    sort_heap = sort_heap
}
