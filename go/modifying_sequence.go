package main

import "math/rand"

func CopyIf(dest []int, src []int, f func(int) bool) int {
	i := 0
	endOfDest := len(dest)
	for _, e := range src {
		if f(e) {
			dest[i] = e
			i++
			if i == endOfDest {
				break
			}
		}
	}
	return i
}

func CopyN(dest []int, src []int, count int) []int {
	for i := 0; i < count; i++ {
		dest[i] = src[i]
	}
	return dest
}

func CopyBackward(dest []int, src []int) int {
	i, j := len(dest)-1, len(src)-1
	for ; i >= 0 && j >= 0; i-- {
		dest[i] = src[j]
		j--
	}
	if i < j { // can't copy all elements from src to dest
		return len(dest) // so we have copied len(dest) elements
	} else {
		return len(src)
	}
}

func Fill(dest []int, value int) {
	for i := range dest {
		dest[i] = value
	}
}

func FillN(dest []int, count int, value int) {
	var end int
	if count < len(dest) {
		end = count
	} else {
		end = len(dest)
	}
	for i := 0; i < end; i++ {
		dest[i] = value
	}
}

func Transform(dest []int, src []int, f func(int) int) []int {
	var minLength int
	if len(dest) < len(src) {
		minLength = len(dest)
	} else {
		minLength = len(src)
	}
	for i := 0; i < minLength; i++ {
		dest[i] = f(src[i])
	}
	return dest
}

func Generate(dest []int, g func() int) {
	for i := range dest {
		dest[i] = g()
	}
}

func GenerateN(dest []int, count int, g func() int) {
	for i := 0; i < count; i++ {
		dest[i] = g()
	}
}

func Remove(src []int, match int) []int {
	var dest []int
	for _, e := range src {
		if e != match {
			dest = append(dest, e)
		}
	}
	return dest
}

func RemoveIf(src []int, f func(int) bool) []int {
	var dest []int
	for _, e := range src {
		if !f(e) {
			dest = append(dest, e)
		}
	}
	return dest
}

func RemoveCopy(dest []int, src []int, match int) []int {
	var tmp []int
	for _, e := range src {
		if e != match {
			tmp = append(tmp, e)
		}
	}
	copy(dest, tmp)
	return dest
}

func RemoveCopyIf(dest []int, src []int, f func(int) bool) []int {
	var tmp []int
	for _, e := range src {
		if !f(e) {
			tmp = append(tmp, e)
		}
	}
	copy(dest, tmp)
	return dest
}

func Replace(src []int, before int, after int) {
	for i := range src {
		if src[i] == before {
			src[i] = after
		}
	}
}

func ReplaceIf(src []int, f func(int) bool, after int) {
	for i, e := range src {
		if f(e) {
			src[i] = after
		}
	}
}

func ReplaceCopy(dest []int, src []int, before int, after int) []int {
	var tmp []int
	for _, e := range src {
		if e != before {
			tmp = append(tmp, e)
		} else {
			tmp = append(tmp, after)
		}
	}
	copy(dest, tmp)
	return dest
}

func ReplaceCopyIf(dest []int, src []int, f func(int) bool, after int) []int {
	var tmp []int
	for _, e := range src {
		if !f(e) {
			tmp = append(tmp, e)
		} else {
			tmp = append(tmp, after)
		}
	}
	copy(dest, tmp)
	return dest
}

func Swap(a *int, b *int) {
	*a, *b = *b, *a
}

func SwapRanges(a []int, b []int, size int) {
	if size > len(a) || size > len(b) {
		if len(a) > len(b) {
			size = len(b)
		} else {
			size = len(a)
		}
	}
	for i := 0; i < size; i++ {
		a[i], b[i] = b[i], a[i]
	}
}

func Reverse(src []int) {
	size := len(src) - 1
	for i := 0; i < size/2+1; i++ {
		src[i], src[size-i] = src[size-i], src[i]
	}
}

func ReverseCopy(dest []int, src []int) []int {
	var size int
	lenOfSrc := len(src)
	if lenOfSrc > len(dest) {
		size = len(dest)
	} else {
		size = lenOfSrc
	}
	lenOfSrc--
	for i := 0; i < size; i++ {
		dest[i] = src[lenOfSrc-i]
	}
	return dest
}

func Rotate(dest []int, pivot int) {
	end := len(dest)
	if pivot <= 0 || pivot >= end || end <= 0 {
		return
	}
	newStart, newPlace := pivot, pivot
	start := 0
	for {
		dest[start], dest[newPlace] = dest[newPlace], dest[start]
		start++
		newPlace++
		if newPlace == end {
			newPlace = newStart
		} else if start == newStart {
			newStart = newPlace
		}
		if start == newPlace {
			break
		}
	}
}

func RotateCopy(dest []int, src []int, pivot int) []int {
	n := copy(dest, src[pivot:])
	copy(dest[n:], src[:pivot])
	return dest
}

func Shuffle(dest []int) {
	end := len(dest)
	for i := range dest {
		rd := rand.Intn(end)
		dest[i], dest[rd] = dest[rd], dest[i]
	}
}

func Unique(dest []int) []int {
	end := len(dest)
	head := 0
	for i := 1; i < end; i++ {
		if dest[head] != dest[i] {
			head++
			dest[head] = dest[i]
		}
	}
	return dest[:head+1]
}

func UniqueCopy(src []int) []int {
	end := len(src)
	dest := make([]int, 0)
	if end <= 0 {
		return dest
	}
	head := 0
	dest = append(dest, src[head])
	for i := 1; i < end; i++ {
		if src[head] != src[i] {
			head = i
			dest = append(dest, src[i])
		}
	}
	return dest
}
