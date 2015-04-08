package main

import "math"

func Max(a int, b int) int {
	if a > b {
		return a
	} else {
		return b
	}
}

func Min(a int, b int) int {
	if a < b {
		return a
	} else {
		return b
	}
}

// return the index of max element instead of its value
func MaxElement(list []int) int {
	idx := 0
	max := math.MinInt32
	for i, e := range list {
		if e > max {
			max = e
			idx = i
		}
	}
	return idx
}

func MinElement(list []int) int {
	idx := 0
	min := math.MaxInt32
	for i, e := range list {
		if e < min {
			min = e
			idx = i
		}
	}
	return idx
}

func MinMaxElement(list []int) (minIdx int, maxIdx int) {
	minIdx, maxIdx = 0, 0
	min, max := math.MaxInt32, math.MinInt32
	for i, e := range list {
		if e < min {
			min = e
			minIdx = i
		}
		if e > max {
			max = e
			maxIdx = i
		}
	}
	return minIdx, maxIdx
}

// is a < b in lexicographical comparison
func LexicographicalCompare(a string, b string) bool {
	if len(a) != len(b) {
		return len(a) < len(b)
	}
	chars := []rune(a)
	for i, e := range b {
		if rune(e) > chars[i] {
			return true
		} else if rune(e) < chars[i] {
			return false
		}
	}
	return false // a == b
}

func IsPermutation(a []int, b []int) bool {
	m := make(map[int]int)
	for _, k := range a {
		if _, exist := m[k]; exist {
			m[k]++
		} else {
			m[k] = 1
		}
	}
	for _, k := range b {
		if _, exist := m[k]; exist {
			m[k]--
			if m[k] < 0 {
				return false
			}
		} else {
			return false
		}
	}
	return true
}

// if the next permutation doesn't exist, return false; else return true
func NextPermutation(list []int) bool {
	size := len(list)
	i := size - 1
	if size > 1 {
		for {
			j := i
			i--
			if list[i] < list[j] {
				k := size - 1
				for list[i] >= list[k] {
					k--
				}
				list[i], list[k] = list[k], list[i]
				Reverse(list[j:])
				return true
			}
			if i == 0 {
				Reverse(list)
				return false
			}
		}
	}
	return false
}

func PrevPermutation(list []int) bool {
	size := len(list)
	if size > 1 {
		i := size - 1
		for {
			j := i
			i--
			if list[i] > list[j] {
				k := size - 1
				for list[k] >= list[i] {
					k--
				}
				list[i], list[k] = list[k], list[i]
				Reverse(list[j:])
				return true
			}
			if i == 0 {
				Reverse(list)
				return false
			}
		}
	}
	return false

}
