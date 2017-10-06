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
}
