let copy = <T>(src: any, dest: any) => {
    for (let i in src) {
        if (dest[i] == undefined) {
            dest[i] = src[i]
        }
    }
}

let copyIf = <T>(src: any, dest: any, func:(e: T)=>boolean) => {
    for (let i in src) {
        if (dest[i] == undefined && func(src[i])) {
            dest[i] = src[i]
        }
    }
}

let copyN = <T>(dest: T[], n: number, value: T) => {
    for (let i = 0; i < n; i++) {
        dest[i] = value
    }
}

let copyBackward = <T>(src: T[], dest: T[]): number => {
    const gap = dest.length - src.length
    if (gap < 0) {
        return -1
    }
    for (let i = 0; i < src.length; i++) {
        dest[i + gap] = src[i]
    }
    return gap
}

let fill = <T>(ary: T[], value: T) => {
    for (let i = 0; i < ary.length; i++) {
        ary[i] = value
    }
}

let fillN = <T>(ary: T[], n: number, value: T) => {
    for (let i = 0; i < n; i++) {
        ary[i] = value
    }
}

let transform = <T>(ary: T[], func:(a: T) => T) => (
    ary.forEach((e: T, idx: number) => (ary[idx] = func(e))))

let generate = <T>(ary: T[], g:() => T) => (
    // forEach doesn't walk through null element
    generateN(ary, ary.length, g))

let generateN = <T>(ary: T[], n: number, g:() => T) => {
    for (let i = 0; i < n; i++) {
        ary[i] = g()
    }
}

let isArray = <T>(coll: any): coll is Array<T> => {
    return coll instanceof Array
}

let _removeIf = <T>(coll: any, func: (e: T) => boolean, needCopy: boolean) => {
    if (isArray(coll)) {
        const ary = new Array()
        for (let e of (coll as Array<T>)) {
            if (func(e) == needCopy) {
                ary.push(e)
            }
        }
        if (needCopy) {
            return ary
        }
        while (coll.length != ary.length) {
            coll.shift()
        }
        for (let i = 0; i < ary.length; i++) {
            coll[i] = ary[i]
        }
    } else if (needCopy) {
        let copy = coll.constructor()
        for (let i in coll) {
            if (coll.hasOwnProperty(i) && func(coll[i])) {
                copy[i] = coll[i]
            }
        }
        return copy
    } else {
        for (let i in coll) {
            if (coll.hasOwnProperty(i) && func(coll[i])) {
                delete coll[i]
            }
        }
    }
}

let removeIf = (coll: any, func: (e: any) => boolean) => (
    _removeIf(coll, func, false))

let remove = (coll: any, value: any) => (
    _removeIf(coll, (e: any) => (e == value), false))

let removeCopyIf = (coll: any, func: (e: any) => boolean) => (
    _removeIf(coll, func, true))

let removeCopy = (coll: any, value: any) => (
    _removeIf(coll, (e: any) => (e == value), true))

let _replaceIf = <T>(coll: any, func: (e: T) => boolean, after: T, needCopy: boolean) => {
    if (isArray(coll)) {
        const ary = new Array()
        coll.forEach((e: T, idx: number) => {
            if (!func(e)) {
                if (needCopy) {
                    ary.push(e)
                }
            } else if (needCopy) {
                    ary.push(after)
            } else {
                coll[idx] = after
            }
        })
        if (needCopy) {
            return ary
        }
    } else if (needCopy) {
        let copy = coll.constructor()
        for (let i in coll) {
            if (coll.hasOwnProperty(i) && func(coll[i])) {
                copy[i] = after
            } else {
                copy[i] = coll[i]
            }
        }
        return copy
    } else {
        for (let i in coll) {
            if (coll.hasOwnProperty(i) && func(coll[i])) {
                coll[i] = after
            }
        }
    }
}

let replaceIf = (coll: any, func: (e: any) => boolean, after: any) => (
    _replaceIf(coll, func, after, false))

let replace = (coll: any, value: any, after: any) => (
    _replaceIf(coll, (e: any) => (e == value), after, false))

let replaceCopyIf = (coll: any, func: (e: any) => boolean, after: any) => (
    _replaceIf(coll, func, after, true))

let replaceCopy = (coll: any, value: any, after: any) => (
    _replaceIf(coll, (e: any) => (e == value), after, true))

let swapRange = <T>(ary1: T[], ary2: T[], start: number, end: number) => {
    if (start < 0 || end > Math.min(ary1.length, ary2.length)) {
        return
    }
    for (let i = start; i < end; i++) {
        [ary1[i], ary2[i]] = [ary2[i], ary1[i]]
    }
}

let reverse = <T>(ary: T[]) => {
    const middle = ary.length / 2
    for (let i = 0; i < middle; i++) {
        [ary[i], ary[ary.length-i-1]] = [ary[ary.length-i-1], ary[i]]
    }
}

let reverseCopy = <T>(ary: T[]) => {
    let copy = new Array<T>(ary.length)
    for (let i = ary.length - 1; i >= 0; i--) {
        copy[ary.length - i - 1] = ary[i]
    }
    return copy
}

let shuffle = <T>(ary: T[]) => {
    for (let i = 0; i < ary.length; i++) {
        const random : number = Math.floor(Math.random() * (i + 1));
        [ary[i], ary[random]] = [ary[random], ary[i]]
    }
}

let rotate = <T>(ary: T[], pivot: number) => (
    ary.push(...ary.splice(0, pivot)))

let rotateCopy = <T>(ary: T[], pivot: number) => {
    return ary.slice(pivot, ary.length).concat(ary.slice(0, pivot))
}

let _unique = <T>(ary: T[], needCopy: boolean) => {
    if (ary.length == 0) return
    let curValue = ary[0]
    let remain : T[] = [curValue]
    for (let i = 1; i < ary.length; i++) {
        if (ary[i] != curValue) {
            curValue = ary[i]
            remain.push(curValue)
        }
    }
    if (needCopy) {
        return remain
    }
    while (ary.length > remain.length) {
        ary.shift()
    }
    for (let i = 0; i < remain.length; i++) {
        ary[i] = remain[i]
    }
}

let unique = <T>(ary: T[]) => (_unique(ary, false))
let uniqueCopy = <T>(ary: T[]) => (_unique(ary, true))

export {
    copy,
    copyIf,
    copyN,
    copyBackward,
    fill,
    fillN,
    transform,
    generate,
    generateN,
    remove,
    removeIf,
    removeCopy,
    removeCopyIf,
    replace,
    replaceIf,
    replaceCopy,
    replaceCopyIf,
    swapRange,
    reverse,
    reverseCopy,
    shuffle,
    rotate,
    rotateCopy,
    unique,
    uniqueCopy,
}
