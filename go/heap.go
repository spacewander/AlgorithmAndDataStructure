package main

import "container/heap"

//import "fmt"

type IntHeap []int

// start to define Heap interface
func (h IntHeap) Len() int           { return len(h) }
func (h IntHeap) Less(i, j int) bool { return h[i] < h[j] } // a min-heap
func (h IntHeap) Swap(i, j int)      { h[i], h[j] = h[j], h[i] }

func (h *IntHeap) Push(x interface{}) {
	*h = append(*h, x.(int))
}

func (h *IntHeap) Pop() interface{} {
	old := *h
	n := len(old)
	x := old[n-1]
	*h = old[:n-1]
	return x
}

// start to implement algorithms
func SortHeap(h *IntHeap) {
	heap.Init(h)
	res := IntHeap{}
	for h.Len() > 0 {
		res = append(res, heap.Pop(h).(int))
	}
	*h = append(*h, res...)
}

func IsHeap(h *IntHeap) bool {
	n := h.Len()
	for i := 1; i < n; i++ {
		if (*h)[i] < (*h)[i-i/2-1] { // for integer, i - i/2 != i/2
			return false
		}
	}
	return true
}

func IsHeapUntil(h *IntHeap) int {
	n := h.Len()
	for i := 1; i < n; i++ {
		if (*h)[i] < (*h)[i-i/2-1] {
			return i
		}
	}
	return n
}

func PushHeap(h *IntHeap, x int) {
	*h = append(*h, x)
	n := h.Len() - 1
	for n != 0 {
		parent := n - n/2 - 1
		if (*h)[n] > (*h)[parent] {
			return
		}
		(*h)[n], (*h)[parent] = (*h)[parent], (*h)[n]
		n = parent
	}
}

func PopHeap(h *IntHeap) int {
	res := (*h)[0]
	*h = (*h)[1:]
	heap.Init(h)
	return res
}

func minIndex(h *IntHeap, a int, b int) int {
	if (*h)[a] < (*h)[b] {
		return a
	} else {
		return b
	}
}

func MakeHeap(h *IntHeap) {
	size := h.Len()
	cur := size/2 - 1
	for cur >= 0 {
		for {
			left := cur*2 + 1
			if left >= size {
				break
			}
			right := left + 1
			smallest := minIndex(h, left, cur)
			if right <= size-1 {
				smallest = minIndex(h, right, smallest)
			}
			if (*h)[smallest] != (*h)[cur] {
				(*h)[cur], (*h)[smallest] = (*h)[smallest], (*h)[cur]
				cur = smallest
			} else {
				break
			}
		}
		cur--
	}
}
