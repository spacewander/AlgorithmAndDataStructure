let merge = <T>(a: T[], b: T[]): T[] => {
    let res = new Array<T>()
    let i = 0
    let j = 0
    while (i < a.length && j < b.length) {
        if (a[i] < b[j]) {
            res.push(a[i])
            i++
        } else if (a[i] == b[j]) {
            res.push(a[i])
            res.push(b[j])
            i++
            j++
        } else {
            res.push(b[j])
            j++
        }
    }
    if (i == a.length) {
        return res.concat(b.slice(j))
    }
    return res.concat(a.slice(i))
}

let inplaceMerge = <T>(a: T[], b: T[]): T[] => {
    let j = 0
    for (let i = 0; i < a.length; i++) {
        while (a[i] >= b[j] && j < b.length) {
            a.splice(i, 0, b[j])
            i++
            j++
        }
    }
    for (; j < b.length; j++) {
        a.push(b[j])
    }
    return a
}

let includes = <T>(a: T[], b: T[]): boolean => {
    for (let i = 0; i < b.length; i++) {
        if (a.indexOf(b[i]) == -1) {
            return false
        }
    }
    return true
}

let union = <T>(a: T[], b: T[]): T[] => {
    return a.filter((e: T) => { return b.indexOf(e) == -1 }).concat(b.slice())
}

let difference = <T>(a: T[], b: T[]): T[] => {
    return a.filter((e: T) => { return b.indexOf(e) == -1 })
}

let symmetricDifference = <T>(a: T[], b: T[]): T[] => {
    let tmp = b.filter((e: T) => { return a.indexOf(e) == -1 })
    return a.filter((e: T) => { return b.indexOf(e) == -1 }).concat(tmp)
}

let intersection = <T>(a: T[], b: T[]): T[] => {
    return a.filter((e: T) => { return b.indexOf(e) != -1 })
}

export {
    merge,
    inplaceMerge,
    includes,
    union,
    difference,
    symmetricDifference,
    intersection,
}
