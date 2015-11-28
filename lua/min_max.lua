function min(a, b)
    return a < b and a or b
end

function max(a, b)
    return a > b and a or b
end

function minmax(a, b)
    if a < b then return a, b end
    return b, a
end

function maxElement(seq)
    local max = #seq == 0 and nil or seq[1]
    for i = 2, #seq do
        max = max > seq[i] and max or seq[i]
    end
    return max
end

function minElement(seq)
    local min = #seq == 0 and nil or seq[1]
    for i = 2, #seq do
        min = min < seq[i] and min or seq[i]
    end
    return min
end

function minmaxElement(seq)
    local min = #seq == 0 and nil or seq[1]
    local max = #seq == 0 and nil or seq[1]
    for i = 1, #seq do
        min = min < seq[i] and min or seq[i]
        max = max > seq[i] and max or seq[i]
    end
    return min, max
end

function lexicographicalCompare(s1, s2)
    if #s1 > #s2 then return false end
    for i = 1, #s1 do
        local ch1 = s1:sub(i, i)
        local ch2 = s2:sub(i, i)
        if ch1 < ch2 then
            return true
        elseif ch1 > ch2 then
            return false
        end
    end
    return true
end

function isPermutation(s1, s2)
    if #s1 ~= #s2 then return false end
    elements = {}
    for _, i in ipairs(s1) do
        elements[i] = elements[i] == nil and 1 or (elements[i] + 1)
    end
    for _, j in ipairs(s2) do
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
            for j = 1, math.floor(#seq / 2) do
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
        if seq[pos1] < seq[i] then
            local pos2 = #seq
            while seq[pos2] >= seq[i] do
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
            for j = 1, math.floor(#seq / 2) do
                seq[j], seq[#seq-j] = seq[#seq-j], seq[j]
            end
            return false
        end
    end
end

return {
    min = min,
    max = max,
    minElement = minElement,
    maxElement = maxElement,
    minmax = minmax,
    minmaxElement = minmaxElement,
    lexicographicalCompare = lexicographicalCompare,
    isPermutation = isPermutation,
    nextPermutation = nextPermutation,
    prevPermutation = prevPermutation
}
