package main

/**
 * Go doesn't support generic. We can fake it with reflectiion or type deduction.
 * But these methods will make code dirty and duplicate, so I just write a version
 * for int
 */
func AllOf(vi []int, f func(int) bool) bool {
	for _, v := range vi {
		if !f(v) {
			return false
		}
	}
	return true
}

func AnyOf(vi []int, f func(int) bool) bool {
	for _, v := range vi {
		if f(v) {
			return true
		}
	}
	return false
}

func NoneOf(vi []int, f func(int) bool) bool {
	for _, v := range vi {
		if f(v) {
			return false
		}
	}
	return true
}

func ForEach(vi []int, f func(int)) {
	for _, v := range vi {
		f(v)
	}
}

func Count(vi []int) int {
	return len(vi)
}

func CountIf(vi []int, f func(int) bool) int {
	counter := 0
	for _, v := range vi {
		if f(v) {
			counter++
		}
	}
	return counter
}

func Mismatch(v1 []int, v2 []int, f2 func(int, int) bool) (mismatchInV1 int,
	mismatchInV2 int, hasMisMatch bool) {
	BoundOfV2 := len(v2)
	for i, v := range v1 {
		if i > BoundOfV2 {
			break
		}
		if !f2(v, v2[i]) {
			return v, v2[i], true
		}
	}
	return 0, 0, false
}

func Equal(v1 []int, v2 []int, f2 func(int, int) bool) bool {
	if len(v1) != len(v2) {
		return false
	} else {
		for i, v := range v1 {
			if !f2(v, v2[i]) {
				return false
			}
		}
	}
	return true
}

func Find(vi []int, t int) int {
	for i, v := range vi {
		if v == t {
			return i
		}
	}
	return -1
}

func FindIf(vi []int, f func(int) bool) int {
	for i, v := range vi {
		if f(v) {
			return i
		}
	}
	return -1
}

func FindIfNot(vi []int, f func(int) bool) int {
	for i, v := range vi {
		if !f(v) {
			return i
		}
	}
	return -1
}
