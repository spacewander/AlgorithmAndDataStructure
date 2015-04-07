package main

func Merge(a []int, b []int) []int {
	start := 0
	end := len(b)
	size := len(a)
	res := []int{}
	for i := 0; i < size; {
		if start == end {
			return append(res, a[i:]...)
		}
		if b[start] < a[i] {
			res = append(res, b[start])
			start++
		} else {
			res = append(res, a[i])
			i++
		}
	}
	return append(res, b[start:]...)
}

// Make two consecutive sorted rangs([start, mid) and [mid, last))
// into sorted range([start, last)).
// Example:
//	a: [1,3,5,2,4] a[:3] : [1,3,5], a[3:] : [2,4]
//	InplaceMerge(a, 3) => [1,2,3,4,5]
func InplaceMerge(a []Pair, mid int, cp func(*Pair, *Pair) bool) {
	j, k := 0, mid
	sizeA := len(a)
	space := make([]Pair, sizeA)

	for i := 0; j < mid || k < sizeA; i++ {
		if j < mid && (k == sizeA || !cp(&a[k], &a[j])) { // <=
			space[i] = a[j]
			j++
		} else {
			space[i] = a[k]
			k++
		}
	}
	copy(a, space)
}

// Is a includes b?
func Includes(a []int, b []int) bool {
	j := 0
	sizeB := len(b)
	for i := range a {
		if j >= sizeB {
			return true
		}
		if a[i] > b[j] {
			return false
		}
		if a[i] == b[j] {
			j++
		}
	}
	return j == sizeB
}

func SetDifference(a []int, b []int) []int {
	res := []int{}
	i, j := 0, 0
	sizeA, sizeB := len(a), len(b)
	for i < sizeA && j < sizeB {
		if a[i] < b[j] {
			res = append(res, a[i])
			i++
		} else if a[i] == b[j] {
			i++
			j++
		} else {
			j++
		}
	}
	if i < sizeA {
		return append(res, a[i:]...)
	}
	return res
}

func SetIntersection(a []int, b []int) []int {
	res := []int{}
	i, j := 0, 0
	sizeA, sizeB := len(a), len(b)
	for i < sizeA && j < sizeB {
		if a[i] < b[j] {
			i++
		} else if a[i] == b[j] {
			res = append(res, a[i])
			i++
			j++
		} else {
			j++
		}
	}
	return res
}

func SetSymmetricDifference(a []int, b []int) []int {
	res := []int{}
	i, j := 0, 0
	sizeA, sizeB := len(a), len(b)
	for i < sizeA && j < sizeB {
		if a[i] < b[j] {
			res = append(res, a[i])
			i++
		} else if a[i] == b[j] {
			i++
			j++
		} else {
			res = append(res, b[j])
			j++
		}
	}
	if i < sizeA {
		return append(res, a[i:]...)
	} else {
		return append(res, b[j:]...)
	}
}

func SetUnion(a []int, b []int) []int {
	res := []int{}
	i, j := 0, 0
	sizeA, sizeB := len(a), len(b)
	for i < sizeA && j < sizeB {
		if a[i] < b[j] {
			res = append(res, a[i])
			i++
		} else if a[i] == b[j] {
			res = append(res, a[i])
			i++
			j++
		} else {
			res = append(res, b[j])
			j++
		}
	}
	if i < sizeA {
		return append(res, a[i:]...)
	} else {
		return append(res, b[j:]...)
	}
}
