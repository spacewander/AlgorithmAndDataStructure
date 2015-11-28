function itoa(v)
    local value = v
    return function()
        value = value + 1
        return value - 1
    end
end

function accumulate(seq, init, func)
    local sum = init
    for i = 1, #seq do
        sum = func(sum, seq[i])
    end
    return sum
end

-- require #s1 == #s2
function innerProduction(s1, s2, init)
    local sum = init
    for i = 1, #s1 do
        sum = sum + s1[i] * s2[i]
    end
    return sum
end

function adjacentDifference(seq)
    if #seq == 0 then return {} end
    local res = {seq[1]}
    for i = 2, #seq do
        res[i] = seq[i] - seq[i-1]
    end
    return res
end

function partialSum(seq)
    if #seq == 0 then return {} end
    local res = {seq[1]}
    for i = 2, #seq do
        res[i] = res[i-1] + seq[i]
    end
    return res
end

return {
    itoa = itoa,
    accumulate = accumulate,
    innerProduction = innerProduction,
    adjacentDifference = adjacentDifference,
    partialSum = partialSum
}
