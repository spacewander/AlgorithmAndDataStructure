package main

type Pair struct {
	A int
	B int
}

// return the index of first element which is out of order
// return len(v) if v is sorted
func IsSortedUntil(v []int, cp func(int, int) bool) int {
	size := len(v)
	for i := 1; i < size; i++ {
		if !cp(v[i-1], v[i]) {
			return i
		}
	}
	return size
}

func IsSorted(v []int, cp func(int, int) bool) bool {
	return IsSortedUntil(v, cp) == len(v)
}

// quicksort
func Sort(v []int, cp func(int, int) bool) {
	size := len(v)
	if size <= 1 {
		return
	}
	pivot := size / 2
	x := v[pivot]
	v[pivot], v[size-1] = v[size-1], v[pivot]
	j := 0
	for i := 0; i < size-1; i++ {
		if cp(v[i], x) {
			v[i], v[j] = v[j], v[i]
			j++
		}
	}
	v[j], v[size-1] = v[size-1], v[j]
	Sort(v[:j], cp)
	Sort(v[j+1:], cp)
}

// insert sort
func StableSort(v []Pair, cp func(*Pair, *Pair) bool) {
	size := len(v)
	if size > 1 {
		for i := 1; i < size; i++ {
			j := i
			e := v[j]
			for k := i; k > 0 && cp(&e, &v[k-1]); j-- {
				k--
				v[j] = v[k]
			}
			v[j] = e
		}
	}
}
