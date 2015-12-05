local Heap = require('./heap')

function sort(seq)
    function partition(seq, startAt, endAt)
        local i = startAt - 1
        for j = startAt, endAt-1 do
            if seq[j] <= seq[endAt] then
                i = i + 1
                seq[i], seq[j] = seq[j], seq[i]
            end
        end
        seq[i+1], seq[endAt] = seq[endAt], seq[i+1]
        return i + 1
    end

    function quicksort(seq, startAt, endAt)
        if startAt < endAt then
            local pivot = partition(seq, startAt, endAt)
            quicksort(seq, startAt, pivot-1)
            quicksort(seq, pivot+1, endAt)
        end
    end

    quicksort(seq, 1, #seq)
end

-- from smallest to largest
function is_sorted(seq)
    for i = 1, #seq-1 do
        if seq[i] > seq[i+1] then return false end
    end
    return true
end

function is_sorted_until(seq)
    for i = 1, #seq-1 do
        if seq[i] > seq[i+1] then return i+1 end
    end
    return #seq + 1
end

-- assume border <= #seq
function partial_sort(seq, border)
    local partition = {}
    Heap.make_heap(seq, function (a, b)
        return a < b
    end)
    for i = 1, border do
        table.insert(partition, (Heap.pop_heap(seq, function (a, b)
            return a < b
        end)))
    end
    for i = 1, border do
        table.insert(seq, i, partition[i])
    end
end

function partial_sort_copy(seq, border)
    local partition = {}
    local heap = {}
    for i = 1, #seq do
        table.insert(heap, seq[i])
    end
    Heap.make_heap(heap, function (a, b)
        return a < b
    end)
    for i = 1, border do
        table.insert(partition, (Heap.pop_heap(heap, function (a, b)
            return a < b
        end)))
    end
    return partition
end

-- insert-sort
function stable_sort(seq, func)
    for i = 1, #seq-1 do
        local min = i
        for j = i+1, #seq do
            if func(seq[j], seq[min]) then min = j end
        end
        local min_element = seq[min]
        table.remove(seq, min)
        table.insert(seq, i, min_element)
    end
end

-- find the nth smallest element, which n is one-base
function nth_element(seq, n)
    local greater = function (a, b)
        return a > b
    end
    local heap = {}
    for i = 1, n do
        table.insert(heap, seq[i])
    end
    Heap.make_heap(heap, greater)
    for i = n+1, #seq do
        if seq[i] < heap[1] then
            Heap.pop_heap(heap, greater)
            Heap.push_heap(heap, seq[i], greater)
        end
    end
    return Heap.pop_heap(heap, greater)
end

return {
    sort = sort,
    is_sorted = is_sorted,
    is_sorted_until = is_sorted_until,
    partial_sort = partial_sort,
    partial_sort_copy = partial_sort_copy,
    stable_sort = stable_sort,
    nth_element = nth_element,
}
