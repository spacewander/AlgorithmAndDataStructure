function merge(a, b)
    local res = {}
    local i = 1
    local j = 1
    while i <= #a and j <= #b do
        if a[i] < b[j] then
            table.insert(res, a[i])
            i = i + 1
        elseif a[i] == b[j] then
            table.insert(res, a[i])
            table.insert(res, b[j])
            i = i + 1
            j = j + 1
        else
            table.insert(res, b[j])
            j = j + 1
        end
    end
    for k = j, #b do
        table.insert(res, b[k])
    end
    for k = i, #a do
        table.insert(res, a[k])
    end
    return res
end

function inplaceMerge(a, b)
    local i = 1
    local j = 1
    while i <= #a do
        while a[i] >= b[j] and j <= #b do
            table.insert(a, i, b[j])
            j = j + 1
        end
        i = i + 1
    end
    for k = j, #b do
        table.insert(a, b[k])
    end
    return a
end

-- a and b is sorted
function includes(a, b)
    if #a < #b then return false end
    local i = 1
    local j = 1
    while i <= #a and j <= #b do
        if a[i] == b[j] then
            i = i + 1
            j = j + 1
        elseif a[i] < b[j] then
            i = i + 1
        else
            j = j + 1
        end
    end
    return j == #b + 1
end

function union(a, b)
    local res = {}
    local i = 1
    local j = 1
    while i <= #a and j <= #b do
        if a[i] < b[j] then
            table.insert(res, a[i])
            i = i + 1
        elseif a[i] == b[j] then
            table.insert(res, a[i])
            i = i + 1
            j = j + 1
        else
            table.insert(res, b[j])
            j = j + 1
        end
    end
    for k = j, #b do
        table.insert(res, b[k])
    end
    for k = i, #a do
        table.insert(res, a[k])
    end
    return res
end

function difference(a, b)
    local res = {}
    local i = 1
    local j = 1
    while i <= #a and j <= #b do
        if a[i] < b[j] then
            table.insert(res, a[i])
            i = i + 1
        elseif a[i] == b[j] then
            i = i + 1
            j = j + 1
        else
            j = j + 1
        end
    end
    for k = i, #a do
        table.insert(res, a[k])
    end
    return res
end

function symmetricDifference(a, b)
    return union(difference(a, b), difference(b, a))
end

function intersection(a, b)
    return difference(union(a, b), symmetricDifference(a, b))
end

return {
    merge = merge,
    inplaceMerge = inplaceMerge,
    includes = includes,
    union = union,
    difference = difference,
    symmetricDifference = symmetricDifference,
    intersection = intersection
}
