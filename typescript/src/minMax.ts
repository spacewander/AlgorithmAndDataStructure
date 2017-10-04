const max = <T>(a: T, b: T) => ( a > b ? a : b)

const min = <T>(a: T, b: T) => ( a > b ? b : a )

const minmax = <T>(a: T, b: T) => {
    return a > b ? {min: b, max: a} : {min:a, max: b}
}

const maxElement = <T>(ary: T[]) => ( ary.reduce(max) )

const minElement = <T>(ary: T[]) => ( ary.reduce(min) )

const minmaxElement = <T>(ary: T[]) => (
    { min: minElement(ary), max: maxElement(ary), }
)

const lexicographicalCompare = <T>(ary1: T[], ary2: T[]) : boolean => {
    if (ary1.length != ary2.length) {
        return ary1.length < ary2.length
    }
    for (let i = 0; i < ary1.length; i++) {
        if (ary1[i] != ary2[i]) {
            return ary1[i] < ary2[i]
        }
    }
    return true
}

const isPermutation = <T>(ary1: T[], ary2: T[]) : boolean => {
    if (ary1.length != ary2.length) {
        return false
    }
    let group = new Map<T, number>()
    ary1.forEach((e) => {
        if (group.has(e)) {
            group.set(e, (group.get(e) as number)+1)
        } else {
            group.set(e, 1)
        }
    })
    for (const e of ary2) {
        let count = group.get(e)
        if (count && count > 0) {
            group.set(e, --count)
            continue
        }
        return false
    }
    return true
}

const nextPermutation = <T>(ary: T[]) : boolean => {
    let pos1, pos2 : number
    let tmp: T
    let i = ary.length - 1
    while (i > 0) {
        pos1 = i--
        if (ary[i] >= ary[pos1]) {
            continue
        }
        pos2 = ary.length - 1
        while (ary[pos2] < ary[i]) {
            pos2--
        }
        [ary[i], ary[pos2]] = [ary[pos2], ary[i]]
        let pivot = (ary.length - pos1) / 2
        for (let j = 0; j < pivot; j++) {
            [ary[ary.length - j - 1], ary[pos1 + j]] = [ary[pos1 +j], ary[ary.length - j - 1]]
        }
        return true
    }
    ary.reverse()
    return false
}

const prevPermutation = <T>(ary: T[]) : boolean => {
    let pos1, pos2 : number
    let tmp: T
    let i = ary.length - 1
    while (i > 0) {
        pos1 = i--
        if (ary[i] <= ary[pos1]) {
            continue
        }
        pos2 = ary.length - 1
        while (ary[pos2] >= ary[i]) {
            pos2--
        }
        [ary[i], ary[pos2]] = [ary[pos2], ary[i]]
        let pivot = (ary.length - pos1) / 2
        for (let j = 0; j < pivot; j++) {
            [ary[ary.length - j - 1], ary[pos1 + j]] = [ary[pos1 +j], ary[ary.length - j - 1]]
        }
        return true
    }
    ary.reverse()
    return false
}

export {
    max,
    min,
    minmax,
    maxElement,
    minElement,
    minmaxElement,
    lexicographicalCompare,
    isPermutation,
    nextPermutation,
    prevPermutation,
}
