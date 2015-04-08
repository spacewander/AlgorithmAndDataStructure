package main

func Itoa(v []int, increment int) {
	for i := range v {
		v[i] = increment
		increment++
	}
}

func Accumulate(v []int, init int, op func(int, int) int) int {
	for _, e := range v {
		init = op(init, e)
	}
	return init
}

func InnerProduct(a []int, b []int, init int) int {
	var size int
	if len(a) > len(b) {
		size = len(b)
	} else {
		size = len(a)
	}
	for i := 0; i < size; i++ {
		init += (a[i] * b[i])
	}
	return init
}

func AdjacentDifference(v []int) []int {
	size := len(v)
	res := append([]int{}, v...)
	for i := 1; i < size; i++ {
		res[i] = v[i] - v[i-1]
	}
	return res
}

func PartialSum(v []int) []int {
	size := len(v)
	res := append([]int{}, v...)
	for i := 1; i < size; i++ {
		res[i] = v[i] + res[i-1]
	}
	return res
}
