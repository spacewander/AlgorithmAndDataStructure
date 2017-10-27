let partitionPoint = <T>(ary: T[], func: (e: T) => boolean): number => {
    for (let i = 0; i < ary.length; i++) {
        if (!func(ary[i])) {
            return i
        }
    }
    return ary.length
}

let isPartitioned = <T>(ary: T[], func: (e: T) => boolean): boolean => {
    let idx = partitionPoint(ary, func)
    for (; idx < ary.length; idx++) {
        if (func(ary[idx])) {
            return false
        }
    }
    return true
}

let partition = <T>(ary: T[], func: (e: T) => boolean) => {
    let pivot = partitionPoint(ary, func)
    for (let i = pivot; i < ary.length; i++) {
        if (func(ary[i])) {
            [ary[pivot], ary[i]] = [ary[i], ary[pivot]]
            pivot++
        }
    }
}

let partitionCopy = <T>(ary: T[], func: (e: T) => boolean): T[] => {
    let res = new Array()
    for (let i = 0; i < ary.length; i++) {
        if (func(ary[i])) {
            res.unshift(ary[i])
        } else {
            res.push(ary[i])
        }
    }
    return res
}

let stablePartition = <T>(ary: T[], func: (e: T) => boolean) => {
    for (let i = 0; i < ary.length; i++) {
        if (!func(ary[i])) {
            let tail = ary.splice(i, 1)
            ary.push(tail[0])
        }
    }
}

export {
    partitionPoint,
    isPartitioned,
    partition,
    partitionCopy,
    stablePartition,
}
