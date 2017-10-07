let lowerBound = <T>(ary: T[], bound: T): number => {
    let count = ary.length
    let start = 0
    while (count > 0) {
        let i = start
        let step = Math.floor(count / 2)
        i += step
        if (ary[i] < bound) {
            start = i + 1
            count -= step + 1
        } else {
            count = step
        }
    }
    return start
}

let upperBound = <T>(ary: T[], bound: T): number => {
    let count = ary.length
    let start = 0
    while (count > 0) {
        let i = start
        let step = Math.floor(count / 2)
        i += step
        if (ary[i] <= bound) {
            start = i + 1
            count -= step + 1
        } else {
            count = step
        }
    }
    return start
}

let binarySearch = <T>(ary: T[], value: T): boolean => {
    let idx = lowerBound(ary, value)
    return idx != ary.length && ary[idx] == value
}

let equalRange = <T>(ary: T[], bound: T) => (
    {lowerBound: lowerBound(ary, bound), upperBound: upperBound(ary, bound)})

export {
    lowerBound,
    upperBound,
    binarySearch,
    equalRange,
}
