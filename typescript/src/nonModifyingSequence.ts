let allOf = <T>(ary: T[], func: (e: T) => boolean): boolean => (
    !ary.some((e: T) => (!func(e))))

let anyOf = <T>(ary: T[], func: (e: T) => boolean): boolean => (
    ary.some((e: T) => (func(e))))

let noneOf = <T>(ary: T[], func: (e: T) => boolean): boolean => (
    !ary.some((e: T) => (func(e))))

let forEach = <T>(collection: any, func: (e: T) => void): void => {
    if (typeof collection[Symbol.iterator] === "function") {
        for (let e of collection) {
            func(e)
        }
    } else {
        for (let k in collection) {
            func(collection[k])
        }
    }
}

let countIf = <T>(collection: any, func: (e: T) => void): number => {
    let count = 0
    if (typeof collection[Symbol.iterator] === "function") {
        for (let e of collection) {
            if (func(e)) {
                count++
            }
        }
    } else {
        for (let k in collection) {
            if (func(collection[k])) {
                count++
            }
        }
    }
    return count
}

let count = <T>(collection: any, match: T): number => (
    countIf(collection, (e: T) => e == match)
)

let mismatch = <T>(ary1: T[], ary2: T[]): number => {
    for (let i = 0; i < ary1.length; i++) {
        if (ary1[i] != ary2[i]) {
            return i
        }
    }
    return ary1.length
}

let equal = <T>(a: T, b: T): boolean => {
    if (a != b) {
        // Sign, we still need JSON.stringify to check equality in ts
        return JSON.stringify(a) == JSON.stringify(b)
    }
    return true
}

let adjacentFind = <T>(ary: T[], func: (a: T, b: T) => boolean): number => {
    if (ary.length > 0) {
        for (let i = 0; i < ary.length-1; i++) {
            if (func(ary[i], ary[i+1])) {
                return i
            }
        }
    }
    return -1
}

let findIf = <T>(collection: any, func: (e: T) => boolean) => {
    for (const i in collection) {
        if (func(collection[i])) {
            return i
        }
    }
    return null
}

let findIfNot = <T>(collection: any, func: (e: T) => boolean) => {
    for (const i in collection) {
        if (!func(collection[i])) {
            return i
        }
    }
    return null
}

let find = <T>(collection: any, match: T) => (
    findIf(collection, (e: T) => (e == match)))

let findFirstOf = <T>(ary: T[], sub: T[]): number => {
    for (let i = 0; i < ary.length; i++) {
        if (sub.indexOf(ary[i]) != -1) {
            return i
        }
    }
    return -1
}

let search = <T>(ary: T[], sub: T[], func: (a: T, b: T) => boolean): number => {
    if (sub.length == 0) {
        return 0
    }
    const aryLen = ary.length-1
    let start = ary.indexOf(sub[0])
    while (start != -1 && start+sub.length-1 <= aryLen) {
        let notFound = false
        for (let i = 1; i < sub.length; i++) {
            if (!func(ary[start+i], sub[i])) {
                notFound = true
                break
            }
        }
        if (!notFound) {
            return start
        }
        start = ary.indexOf(sub[0], start+1)
    }
    return -1
}

let searchN = <T>(ary: T[], n: number, value: T, func: (a: T, b: T) => boolean): number => {
    const sub = new Array<T>(n)
    for (let i = 0; i < n; i++) {
        sub[i] = value
    }
    return search(ary, sub, func)
}

let findEnd = <T>(ary: T[], sub: T[]): number => {
    const subLen = sub.length-1
    if (subLen == -1) {
        return 0
    }
    let end = ary.lastIndexOf(sub[subLen])
    while (end >= subLen) {
        let notFound = false
        for (let i = 0; i < subLen; i++) {
            if (ary[end-subLen+i] != sub[i]) {
                notFound = true
                break
            }
        }
        if (!notFound) {
            return end - subLen
        }
        end = ary.lastIndexOf(sub[subLen], end-1)
    }
    return -1
}

export {
    allOf,
    anyOf,
    noneOf,
    forEach,
    countIf,
    count,
    mismatch,
    equal,
    adjacentFind,
    find,
    findIf,
    findIfNot,
    findFirstOf,
    findEnd,
    search,
    searchN,
}
