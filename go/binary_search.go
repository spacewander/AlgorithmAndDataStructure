package main

// the value in v should be sorted

// return the index of first element which is not less than value
func LowerBound(v []int, value int) (idx int, found bool) {
	count := len(v)
	idx = 0
	for count > 0 {
		step := count / 2
		stop := idx + step
		if v[stop] < value {
			idx = stop + 1
			count -= step + 1
		} else {
			count = step
		}
	}
	return idx, idx < len(v)
}

// return the index of first element which is greater than value
func UpperBound(v []int, value int) (idx int, found bool) {
	count := len(v)
	idx = 0
	for count > 0 {
		step := count / 2
		stop := idx + step
		if v[stop] <= value {
			idx = stop + 1
			count -= step + 1
		} else {
			count = step
		}
	}
	return idx, idx < len(v)
}

func BinarySearch(v []int, value int) bool {
	idx, found := LowerBound(v, value)
	return found && value == v[idx]
}

func EqualRange(v []int, value int) (from int, to int) {
	from, found := LowerBound(v, value)
	if found {
		to, _ = UpperBound(v, value) // from <= to <= len(v)
		return from, to
	} else {
		return from, len(v) // from == len(v)
	}
}
