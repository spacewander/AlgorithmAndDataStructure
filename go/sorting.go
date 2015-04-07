package main

import "container/heap"
import "sort"

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

func PartialSort(in []int, border int) {
	size := len(in)
	h := IntHeap(in[:border])
	heap.Init(&h)
	for i := border; i < size; i++ {
		if in[i] < h[0] {
			in[i], h[0] = h[0], in[i]
			x := heap.Pop(&h)
			h = append(h, x.(int))
		}
	}
	SortHeap(&h)
}

func PartialSortCopy(v []int, border int, out []int) {
	in := v[:border]
	inSize := len(in)
	outSize := len(out)
	if inSize <= outSize {
		copy(out, in)
		sort.Ints(out[:inSize])
	} else {
		space := make([]int, inSize)
		copy(space, in)
		sort.Ints(space)
		copy(out, space)
	}
}

func quickSelect(v []int, left int, right int, border int) int {
	v[border], v[right] = v[right], v[border]
	storeIdx := left
	for i := left; i < right; i++ {
		if v[i] < v[right] {
			v[storeIdx], v[i] = v[i], v[storeIdx]
			storeIdx++
		}
	}
	v[right], v[storeIdx] = v[storeIdx], v[right]
	return storeIdx
}

//The difference between PartialSort and NthElement is PartialSort sorts the
// elements in [0, border), while NthElement just makes sure that elements in [0, border) are all less than element in border
func NthElement(v []int, border int) {
	left := 0
	right := len(v) - 1
	for {
		if left >= border || right <= border {
			break
		}
		nth := quickSelect(v, left, right, border)
		if nth == border { // left <= nth, border <= right
			break
		}
		if nth < border {
			left = nth
		} else {
			right = nth
		}
	}
}
