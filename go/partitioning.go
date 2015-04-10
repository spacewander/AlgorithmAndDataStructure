package main

func IsPartitioned(v []int, f func(int) bool) bool {
	start := 0
	end := len(v)
	for i := range v {
		if !f(v[i]) {
			start = i
			break
		}
	}
	for i := start; i < end; i++ {
		if f(v[i]) {
			return false
		}
	}
	return true
}

// move true elements before all false elements, and return the index of first false element
func Partition(v []int, f func(int) bool) int {
	start := 0
	end := len(v)
	for start != end && f(v[start]) {
		start++
	}
	for i := start; i < end; i++ {
		if f(v[i]) {
			v[start], v[i] = v[i], v[start]
			start++
		}
	}
	return start
}

func PartitionCopy(v []int, f func(int) bool) (
	truePart []int, falsePart []int) {
	truePart, falsePart = []int{}, []int{}
	for _, e := range v {
		if f(e) {
			truePart = append(truePart, e)
		} else {
			falsePart = append(falsePart, e)
		}
	}
	return truePart, falsePart
}

func StablePartition(v []int, f func(int) bool) int {
	start, end := 0, len(v)
	for start != end && f(v[start]) {
		start++
	}
	for pioneer := start; pioneer < end; pioneer++ {
		if f(v[pioneer]) {
			v[start], v[pioneer] = v[pioneer], v[start]
			start++
			follower := pioneer
			for follower != start {
				v[follower], v[follower-1] = v[follower-1], v[follower]
				follower--
			}
		}
	}
	return start
}

// Return the index of first element which doesn't satisfy function f.
// If the input v is partitioned, this index is the partition point.
func PartitionPoint(v []int, f func(int) bool) int {
	for i := range v {
		if !f(v[i]) {
			return i
		}
	}
	return len(v)
}
