local function partition_point(seq, func)
    for i = 1, #seq do
        if not func(seq[i]) then return i end
    end
    return #seq + 1
end

local function is_partitioned(seq, func)
    local pivot = partition_point(seq, func)
    for i = pivot, #seq do
        if func(seq[i]) then return false end
    end
    return true
end

local function partition(seq, func)
    local pivot = partition_point(seq, func)
    for i = pivot, #seq do
        if func(seq[i]) then
            seq[i], seq[pivot] = seq[pivot], seq[i]
            pivot = pivot + 1
        end
    end
end

local function partition_copy(seq, func)
    local copy = {}
    for i = 1, #seq do
        if func(seq[i]) then
            table.insert(copy, 1, seq[i])
        else
            table.insert(copy, seq[i])
        end
    end
    return copy
end

local function stable_partition(seq, func)
    local seq_size = #seq
    local idx = 1
    for time = 1, seq_size do
        if not func(seq[idx]) then
            table.insert(seq, seq[idx])
            table.remove(seq, idx)
        else
            idx = idx + 1
        end
    end
end

return {
    is_partitioned = is_partitioned,
    partition_point = partition_point,
    partition = partition,
    partition_copy = partition_copy,
    stable_partition = stable_partition
}
