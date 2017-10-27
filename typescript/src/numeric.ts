let itoa = (init: number): ()=>number => {
    let value = init
    return (): number => { return value++ }
}

let accumulate = <T>(ary: T[], init: T, func: (a: T, b: T) => T): T => {
    return ary.reduce(func, init)
}

// assume ary2.length >= ary1.length
let innerProduction = (ary1: number[], ary2: number[], init: number): number => {
    return ary1.reduce((prev: number, cur: number, idx: number): number => {
        return prev + cur * ary2[idx]
    }, init)
}

let adjacentDifference = (ary: number[]): number[] => {
    if (ary.length == 0) {
        return new Array<number>()
    }
    let res: number[] = [ary[0]]
    for (let i = 1; i < ary.length; i++) {
        res.push(ary[i] - ary[i - 1])
    }
    return res
}

let partialSum = (ary: number[]): number[] => {
    if (ary.length == 0) {
        return new Array<number>()
    }
    let res: number[] = [ary[0]]
    ary.reduce((prev: number, cur: number): number => {
        res.push(prev + cur)
        return prev + cur
    })
    return res
}

export {
    itoa,
    accumulate,
    innerProduction,
    adjacentDifference,
    partialSum,
}
