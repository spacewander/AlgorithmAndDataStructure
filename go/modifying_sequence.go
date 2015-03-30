package main

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
