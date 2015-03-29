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

// find first element in sub-scope occurs in given scope
func FindFirstOf(scope []int, subScope []int,
	f2 func(int, int) bool) (index int, found bool) {

	for i := range scope {
		for _, v := range subScope {
			if f2(scope[i], v) {
				return i, true
			}
		}
	}
	return -1, false
}

func FindEnd(scope []int, subScope []int,
	f2 func(int, int) bool) (index int, found bool) {

	lenOfScope := len(scope)
	lenOfSubScope := len(subScope)
	if lenOfScope < lenOfSubScope {
		return -1, false
	}
	i := lenOfScope - lenOfSubScope
	for {
		for j := 0; ; j++ {
			if j == lenOfSubScope {
				return i, true
			}
			if !f2(scope[i+j], subScope[j]) {
				if i > 0 {
					i--
					break
				} else {
					return -1, false
				}
			}
		}

	}
}

func AdjacentFind(vi []int, f2 func(int, int) bool) (index int, found bool) {
	boundOfVi := len(vi) - 1
	for i := 0; i < boundOfVi; i++ {
		if f2(vi[i], vi[i+1]) {
			return i, true
		}
	}
	return -1, false
}

func Search(scope []int, subScope []int, f2 func(int, int) bool) (value int,
	found bool) {
	lenOfScope := len(scope)
	lenOfSubScope := len(subScope)
	i := 0
	if i > lenOfScope-lenOfSubScope {
		return -1, false
	}
	for {
		for j := 0; ; j++ {
			if j == lenOfSubScope {
				return i, true
			}
			if !f2(scope[i+j], subScope[j]) {
				if i < lenOfScope-lenOfSubScope {
					i++
					break
				} else {
					return -1, false
				}
			}
		}
	}
}

func SearchN(scope []int, count int, match int, f2 func(int, int) bool) (
	value int, found bool) {
	lenOfScope := len(scope)
	i := 0
	if i > lenOfScope-count {
		return -1, false
	}
	for {
		for j := 0; ; j++ {
			if j == count {
				return i, true
			}
			if !f2(scope[i+j], match) {
				if i < lenOfScope-count {
					i++
					break
				} else {
					return -1, false
				}
			}
		}
	}
}
