local Bs = {}

-- return index of the first element which is not less than given value
-- remember lua starts its index from 1
function Bs.lowerBound(seq, value)
    local count = #seq
    local start = 1
    while count > 0 do
        local i = start
        local step = math.floor(count / 2)
        i = i + step
        if seq[i] < value then
            start = i + 1
            count = count - step - 1
        else
            count = step
        end
    end
    return start
end

function Bs.upperBound(seq, value)
    local count = #seq
    local start = 1
    while count > 0 do
        local i = start
        local step = math.floor(count / 2)
        i = i + step
        if seq[i] <= value then
            start = i + 1
            count = count - step - 1
        else
            count = step
        end
    end
    return start
end

function Bs.binarySearch(seq, value)
    local i = Bs.lowerBound(seq, value)
    return i ~= #seq and seq[i] == value
end

function Bs.equalRange(seq, value)
    return Bs.lowerBound(seq, value), Bs.upperBound(seq, value)
end

return Bs
