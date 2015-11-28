function min(a, b)
    return a < b and a or b
end

function max(a, b)
    return a > b and a or b
end

function minMax(a, b)
    return a > b and a, b or b, a
end

function maxElement(seq)
    local max = #seq == 0 and nil or seq[1]
    for i in seq do
        max = max > i and max or i
    end
    return max
end

function minElement(seq)
    local min = #seq == 0 and nil or seq[1]
    for i in seq do
        min = min < i and min or i
    end
    return min
end

function minmaxElement(seq)
    local min = #seq == 0 and nil or seq[1]
    local max = #seq == 0 and nil or seq[1]
    for i in seq do
        min = min < i and min or i
        max = max > i and max or i
    end
    return min, max
end

function lexicographicalCompare(s1, s2)
    if #s1 > #s2 then return false end
    for i = 1, #s1 do
        if s1[i] < s2[i] then
            return true
        elseif s1[i] > s2[i] then
            return false
        end
    end
    return true
end

function isPermutation(s1, s2)
    if #s1 ~= #s2 then return false end
    elements = {}
    for i in s1 do
        elements[i] = elements[i] == nil and 1 or (elements[i] + 1)
    end
    for j in s2 do
        if elements[j] ~= nil and elements[j] > 0 then
            elements[j] = elements[j] - 1
        else
            return false
        end
    end
    return true
end

function nextPermutation(seq)
    if #seq <= 1 then return false end
    local i = #seq
    while true do
        local pos1 = i
        i = i - 1
        if seq[i] < seq[pos1] then
            local pos2 = #seq
            while seq[i] >= seq[pos2] do
                pos2 = pos2 - 1
            end
            seq[i], seq[pos2] = seq[pos2], seq[i]
            local pivot = math.floor((#seq - pos1) / 2)
            for j = 0, pivot do
                seq[#seq-j], seq[pos1+j] = seq[pos1+j], seq[#seq-j]
            end
            return true
        end
        if i == 1 then
            for j in 1, math.floor(#seq / 2) do
                seq[j], seq[#seq-j] = seq[#seq-j], seq[j]
            end
            return false
        end
    end
end

function prevPermutation(seq)
    if #seq <= 1 then return false end
    local i = #seq
    while true do
        local pos1 = i
        i = i - 1
        if seq[i] < seq[pos1] then
            local pos2 = #seq
            while seq[i] >= seq[pos2] do
                pos2 = pos2 - 1
            end
            seq[i], seq[pos2] = seq[pos2], seq[i]
            local pivot = math.floor((#seq - pos1) / 2)
            for j = 0, pivot do
                seq[#seq-j], seq[pos1+j] = seq[pos1+j], seq[#seq-j]
            end
            return true
        end
        if i == 1 then
            for j in 1, math.floor(#seq / 2) do
                seq[j], seq[#seq-j] = seq[#seq-j], seq[j]
            end
            return false
        end
    end
end

return {
    min = min,
    max = max,
    minElement = maxElement,
    maxElement = maxElement,
    minMax = minMax,
    minmaxElement = minmaxElement,
    lexicographicalCompare = lexicographicalCompare,
    isPermutation = isPermutation,
    nextPermutation = nextPermutation,
    prevPermutation = prevPermutation
}
