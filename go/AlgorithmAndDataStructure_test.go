package main_test

import (
	"container/heap"

	Algo "AlgorithmAndDataStructure"

	. "github.com/onsi/ginkgo"
	. "github.com/onsi/gomega"
)

var _ = Describe("AlgorithmAndDataStructure", func() {

	Describe("non modifying sequence", func() {
		var a []int
		var b []int
		var equal func(int, int) bool

		BeforeEach(func() {
			a = []int{1, 2, 3}
			b = []int{1, 1, 3}
			equal = func(i int, j int) bool {
				return i == j
			}

		})

		Context("AllOf", func() {
			It("should be true", func() {
				Expect(Algo.AllOf(a, func(i int) bool {
					return i < 4
				})).To(BeTrue())
			})

			It("should be false", func() {
				Expect(Algo.AllOf(a, func(i int) bool {
					return i < 3
				})).To(BeFalse())
			})
		})

		It("AnyOf", func() {
			Expect(Algo.AnyOf(a, func(i int) bool {
				return i > 1
			})).To(BeTrue())
		})

		It("NoneOf", func() {
			Expect(Algo.NoneOf(a, func(i int) bool {
				return i > 4
			})).To(BeTrue())
		})

		It("ForEach", func() {
			tmp := make([]int, 0)
			Algo.ForEach(a, func(i int) {
				tmp = append(tmp, i)
			})
			Expect(tmp).To(Equal(a))
		})

		It("Count", func() {
			Expect(Algo.Count(a)).To(Equal(len(a)))
		})

		It("CountIf", func() {
			Expect(Algo.CountIf(a, func(i int) bool {
				return i%2 == 0
			})).To(Equal(1))
		})

		Context("Mismatch", func() {
			It("has misMatch", func() {
				first, second, hasMisMatch := Algo.Mismatch(a, b,
					func(i int, j int) bool {
						return i == j
					})
				Expect(hasMisMatch).To(BeTrue())
				Expect(first).To(Equal(2))
				Expect(second).To(Equal(1))
			})

			It("don't has mismatch", func() {
				c := make([]int, len(a))
				copy(c, a)
				first, second, hasMisMatch := Algo.Mismatch(a, c,
					func(i int, j int) bool {
						return i == j
					})
				Expect(hasMisMatch).To(BeFalse())
				Expect(first).To(Equal(0))
				Expect(second).To(Equal(0))
			})
		})

		It("Equal", func() {
			same := []int{1, 2, 3}
			Expect(Algo.Equal(a, same, func(first int, second int) bool {
				return first == second
			})).To(BeTrue())
		})

		It("Find", func() {
			Expect(Algo.Find(a, 2)).To(Equal(1))
		})

		It("FindIf", func() {
			Expect(Algo.FindIf(a, func(i int) bool {
				return i == 2
			})).To(Equal(1))
		})

		It("FindIfNot", func() {
			Expect(Algo.FindIfNot(a, func(i int) bool {
				return i == 2
			})).To(Equal(0))
		})

		Context("FindFirstOf", func() {
			It("Not existed", func() {
				tmp := []int{4, 5, 6}
				_, found := Algo.FindFirstOf(tmp, a, equal)
				Expect(found).To(BeFalse())
			})

			It("Only one existed", func() {
				tmp := []int{0, 1}
				idx, found := Algo.FindFirstOf(tmp, a, equal)
				Expect(found).To(BeTrue())
				Expect(idx).To(Equal(1))
			})

			It("existed many times", func() {
				tmp := []int{0, 1, 2, 3, 1, 2, 3}
				idx, _ := Algo.FindFirstOf(tmp, a, equal)
				Expect(idx).To(Equal(1))
			})
		})

		Context("FindEnd", func() {
			It("Not Existed", func() {
				tmp := []int{1, 2, 0}
				_, found := Algo.FindEnd(tmp, a, equal)
				Expect(found).To(BeFalse())
			})

			It("Existed", func() {
				tmp := []int{1, 2, 1, 2, 1}
				c := []int{1, 2, 1}
				idx, found := Algo.FindEnd(tmp, c, equal)
				Expect(found).To(BeTrue())
				Expect(idx).To(Equal(2))
			})
		})

		Context("AdjacentFind", func() {
			It("Not existed", func() {
				tmp := []int{1, 2, 3}
				_, found := Algo.AdjacentFind(tmp, equal)
				Expect(found).To(BeFalse())
			})

			It("Existed", func() {
				tmp := []int{1, 1, 3}
				idx, found := Algo.AdjacentFind(tmp, equal)
				Expect(found).To(BeTrue())
				Expect(idx).To(Equal(0))
			})
		})

		Context("Search", func() {
			It("Not existed", func() {
				tmp := []int{1, 2, 2, 4}
				_, found := Algo.Search(tmp, a, equal)
				Expect(found).To(BeFalse())
			})

			It("Existed", func() {
				tmp := []int{0, 1, 2, 3}
				idx, found := Algo.Search(tmp, a, equal)
				Expect(found).To(BeTrue())
				Expect(idx).To(Equal(1))
			})
		})

		Context("SearchN", func() {
			tmp := []int{0, 1, 1, 1}

			It("Existed", func() {
				idx, found := Algo.SearchN(tmp, 3, 1, equal)
				Expect(found).To(BeTrue())
				Expect(idx).To(Equal(1))
			})

			It("Not existed", func() {
				_, found := Algo.SearchN(tmp, 4, 1, equal)
				Expect(found).To(BeFalse())
			})
		})
	})

	Describe("modifying sequence", func() {
		var src []int
		var dest []int
		var isOdd func(int) bool

		BeforeEach(func() {
			src = []int{1, 2, 3}
			dest = make([]int, 3)
			isOdd = func(i int) bool {
				return i%2 != 0
			}
		})

		It("CopyIf", func() {
			Expect(Algo.CopyIf(dest, src, isOdd)).To(Equal(2))
			Expect(dest[0]).To(Equal(src[0]))
			Expect(dest[1]).To(Equal(src[2]))
		})

		It("CopyN", func() {
			Algo.CopyN(dest, src, 1)
			Expect(dest[0]).To(Equal(src[0]))
			Expect(dest[1]).NotTo(Equal(src[1]))
		})

		It("CopyBackward", func() {
			dest = make([]int, 2)
			Expect(Algo.CopyBackward(dest, src)).To(Equal(2))
			Expect(dest[0]).To(Equal(src[1]))
			Expect(dest[1]).To(Equal(src[2]))
		})

		It("Fill", func() {
			tmp := []int{1, 1, 1}
			Algo.Fill(dest, 1)
			Expect(dest).To(Equal(tmp))
		})

		It("FillN", func() {
			tmp := []int{1, 1, 1}
			Algo.FillN(dest, 3, 1)
			Expect(dest).To(Equal(tmp))
			Algo.FillN(dest, len(dest)+1, 1)
		})

		It("Transform", func() {
			dest = make([]int, 2)
			plusOne := func(prev int) int {
				return prev + 1
			}
			Expect(Algo.Transform(dest, src, plusOne)).
				To(Equal([]int{2, 3}))
		})

		Context("Generate", func() {
			allAreOne := func() int {
				return 1
			}

			It("Generate", func() {
				Algo.Generate(dest, allAreOne)
				Expect(dest).To(Equal([]int{1, 1, 1}))
			})

			It("GenerateN", func() {
				dest[2] = 2
				Algo.GenerateN(dest, 2, allAreOne)
				Expect(dest).To(Equal([]int{1, 1, 2}))
			})
		})

		It("Remove", func() {
			Expect(Algo.Remove(src, 1)).To(Equal([]int{2, 3}))
		})

		It("RemoveIf", func() {
			Expect(Algo.RemoveIf(src, isOdd)).To(Equal([]int{2}))
		})

		It("RemoveCopy", func() {
			Algo.RemoveCopy(dest, src, 3)
			Expect(dest[0]).To(Equal(src[0]))
			Expect(dest[1]).To(Equal(src[1]))
			Expect(dest[2]).NotTo(Equal(src[2]))
		})

		It("RemoveCopyIf", func() {
			Algo.RemoveCopyIf(dest, src, isOdd)
			Expect(dest[0]).To(Equal(src[1]))
		})

		It("Replace", func() {
			Algo.Replace(src, 1, 2)
			Expect(src).To(Equal([]int{2, 2, 3}))
		})

		It("ReplaceIf", func() {
			Algo.ReplaceIf(src, isOdd, 2)
			Expect(src).To(Equal([]int{2, 2, 2}))
		})

		It("ReplaceCopy", func() {
			Algo.ReplaceCopy(dest, src, 3, 1)
			Expect(dest).To(Equal([]int{1, 2, 1}))
		})

		It("ReplaceCopyIf", func() {
			Algo.ReplaceCopyIf(dest, src, isOdd, 1)
			Expect(dest).To(Equal([]int{1, 2, 1}))
		})

		It("Swap", func() {
			a := 3
			b := 1
			Algo.Swap(&a, &b)
			Expect(a).To(Equal(1))
			Expect(b).To(Equal(3))
		})

		It("SwapRanges", func() {
			dest = []int{4, 5, 6}
			Algo.SwapRanges(dest, src, 2)
			Expect(src).To(Equal([]int{4, 5, 3}))
			Expect(dest).To(Equal([]int{1, 2, 6}))
		})

		Context("Reverse", func() {
			It("Odd", func() {
				Algo.Reverse(src)
				Expect(src).To(Equal([]int{3, 2, 1}))
			})

			It("Even", func() {
				even := []int{1, 2, 3, 4}
				Algo.Reverse(even)
				Expect(even).To(Equal([]int{4, 3, 2, 1}))
			})
		})

		It("ReverseCopy", func() {
			Expect(Algo.ReverseCopy(dest, src)).To(Equal([]int{3, 2, 1}))
		})

		Context("Rotate", func() {
			It("with pivot == 2", func() {
				Algo.Rotate(src, 2)
				Expect(src).To(Equal([]int{3, 1, 2}))
			})

			It("with pivot == 1", func() {
				Algo.Rotate(src, 1)
				Expect(src).To(Equal([]int{2, 3, 1}))
			})

			It("with wrong pivot", func() {
				Algo.Rotate(src, 3)
				Expect(src).To(Equal([]int{1, 2, 3}))
			})
		})

		It("RotateCopy", func() {
			Expect(Algo.RotateCopy(dest, src, 2)).To(Equal([]int{3, 1, 2}))
		})

		It("Shuffle", func() {
			Algo.Shuffle(src)
		})

		Context("Unique algorithms", func() {
			var duplicate []int

			BeforeEach(func() {
				duplicate = []int{1, 1, 2, 2}
			})

			It("Unique", func() {
				Expect(Algo.Unique(duplicate)).To(Equal([]int{1, 2}))
				Expect(duplicate).NotTo(Equal([]int{1, 1, 2, 2}))
			})

			It("UniqueCopy", func() {
				Expect(Algo.UniqueCopy(duplicate)).To(Equal([]int{1, 2}))
			})
		})
	})

	Describe("Heap", func() {
		var h *Algo.IntHeap
		var hp *Algo.IntHeap

		BeforeEach(func() {
			h = &Algo.IntHeap{2, 1, 5}
			hp = &Algo.IntHeap{2, 1, 5}
			heap.Init(hp)
		})

		It("SortHeap", func() {
			Algo.SortHeap(h)
			Expect(*h).To(Equal(Algo.IntHeap{1, 2, 5}))
		})

		It("isHeap", func() {
			Expect(Algo.IsHeap(h)).To(BeFalse())
			heap.Init(h)
			Expect(Algo.IsHeap(h)).To(BeTrue())
		})

		It("IsHeapUntil", func() {
			Expect(Algo.IsHeapUntil(h)).To(Equal(1))
			heap.Init(h)
			Expect(Algo.IsHeapUntil(h)).To(Equal(h.Len()))
		})

		It("PushHeap", func() {
			x := 3
			Algo.PushHeap(hp, x)
			Expect(*hp).To(ContainElement(x))
			Expect(Algo.IsHeap(hp)).To(BeTrue())
		})

		It("PopHeap", func() {
			Expect(Algo.PopHeap(hp)).To(Equal(1))
		})

		It("MakeHeap", func() {
			Algo.MakeHeap(h)
			Expect(h).To(Equal(hp))
		})

	})

	Describe("BinarySearch", func() {
		var v1 []int
		var v2 []int

		BeforeEach(func() {
			v1 = []int{1, 2, 4, 8, 16}
			v2 = []int{1, 2, 3, 4}
		})

		Context("LowerBound", func() {
			It("v1", func() {
				idx, _ := Algo.LowerBound(v1, 4)
				Expect(v1[idx]).To(Equal(4))

				idx, _ = Algo.LowerBound(v1, 1)
				Expect(v1[idx]).To(Equal(1))

				_, found := Algo.LowerBound(v1, 17)
				Expect(found).To(BeFalse())
			})

			It("v1 more", func() {
				idx, found := Algo.LowerBound(v1, 3)
				Expect(v1[idx]).To(Equal(4))
				Expect(found).To(BeTrue())
			})

			It("v2", func() {
				idx, _ := Algo.LowerBound(v2, 3)
				Expect(v2[idx]).To(Equal(3))

				idx, _ = Algo.LowerBound(v2, 2)
				Expect(v2[idx]).To(Equal(2))
			})
		})

		Context("UpperBound", func() {
			It("v1", func() {
				idx, _ := Algo.UpperBound(v1, 4)
				Expect(v1[idx]).To(Equal(8))

				idx, found := Algo.UpperBound(v1, 5)
				Expect(found).To(BeTrue())
				Expect(v1[idx]).To(Equal(8))

				_, found = Algo.UpperBound(v1, 16)
				Expect(found).To(BeFalse())

				idx, _ = Algo.UpperBound(v1, 0)
				Expect(v1[idx]).To(Equal(1))
			})

			It("v2", func() {
				idx, _ := Algo.UpperBound(v2, 3)
				Expect(v2[idx]).To(Equal(4))

				idx, _ = Algo.UpperBound(v2, 2)
				Expect(v2[idx]).To(Equal(3))
			})
		})

		Context("BinarySearch", func() {
			It("found", func() {
				Expect(Algo.BinarySearch(v1, 4)).To(BeTrue())
			})

			It("Not found", func() {
				Expect(Algo.BinarySearch(v1, 0)).To(BeFalse())
			})
		})

		It("EqualRange", func() {
			from, to := Algo.EqualRange(v1, 4)
			Expect(v1[from]).To(Equal(4))
			Expect(v1[to]).To(Equal(8))

			from, _ = Algo.EqualRange(v1, 0)
			Expect(from).To(Equal(0))

			from, to = Algo.EqualRange(v1, 17)
			Expect(from).To(Equal(len(v1)))
			Expect(to).To(Equal(len(v1)))
		})
	})

	Describe("Sorting", func() {
		var sorted []int
		var v []int
		var less func(int, int) bool

		BeforeEach(func() {
			sorted = []int{1, 2, 3, 4}
			v = []int{190, 20, 4, 4, 10}
			less = func(a int, b int) bool {
				return a < b
			}
		})

		It("isSorted", func() {
			Expect(Algo.IsSorted(sorted, less)).To(BeTrue())
			Expect(Algo.IsSorted(v, less)).To(BeFalse())
		})

		It("isSortedUntil", func() {
			Expect(Algo.IsSortedUntil(sorted, less)).To(Equal(len(sorted)))
			Expect(Algo.IsSortedUntil(v, less)).To(Equal(1))
		})

		It("Sort", func() {
			sortedV := []int{4, 4, 10, 20, 190}
			Algo.Sort(v, less)
			Expect(v).To(Equal(sortedV))

			unsorted := []int{3, 4, 2, 1}
			Algo.Sort(unsorted, less)
			Expect(unsorted).To(Equal(sorted))
		})

		It("StableSort", func() {
			pairLess := func(x *Algo.Pair, y *Algo.Pair) bool {
				return x.A < y.A
			}

			Pairs := []Algo.Pair{
				{8, 20},
				{10, 9},
				{8, 10},
				{20, 10},
				{10, 11},
				{10, 10},
			}

			Algo.StableSort(Pairs, pairLess)
			Expect(Pairs[0]).To(Equal(Algo.Pair{8, 20}))
			Expect(Pairs[2]).To(Equal(Algo.Pair{10, 9}))
			Expect(Pairs[3]).To(Equal(Algo.Pair{10, 11}))
			Expect(Pairs[5]).To(Equal(Algo.Pair{20, 10}))
		})

		It("PartialSort", func() {
			Algo.PartialSort(v, 2)
			Expect(v[0]).To(Equal(4))
			Expect(v[1]).To(Equal(4))
		})

		Context("PartialSortCopy", func() {
			It("len(out) >= len(in)", func() {
				out := []int{0, 0}
				Algo.PartialSortCopy(v, 2, out)
				Expect(out).To(Equal([]int{20, 190}))
			})

			It("len(out) < len(in)", func() {
				out := []int{0, 0}
				Algo.PartialSortCopy(v, 3, out)
				Expect(out).To(Equal([]int{4, 20}))
			})
		})

		It("NthElement", func() {
			Algo.NthElement(v, 3)
			Expect(v[2]).To(Equal(10))
			Expect(v[1] <= v[3]).To(BeTrue())

			Algo.NthElement(v, 2)
			Expect(v[1]).To(Equal(4))
			Expect(v[0] <= v[2]).To(BeTrue())

			Algo.NthElement(v, 4)
			Expect(v[3]).To(Equal(20))
			Expect(v[2] <= v[4]).To(BeTrue())
		})
	})

	Describe("Set", func() {
		var a []int
		var b []int

		BeforeEach(func() {
			a = []int{1, 2, 3, 4}
			b = []int{3, 4, 5, 6}
		})

		Context("Merge", func() {
			It("empty sets", func() {
				empty := []int{}
				Expect(Algo.Merge(a, empty)).To(Equal(a))
				Expect(Algo.Merge(empty, a)).To(Equal(a))
				Expect(Algo.Merge(empty, empty)).To(Equal(empty))
			})

			It("non-empty sets", func() {
				ab := []int{1, 2, 3, 3, 4, 4, 5, 6}
				Expect(Algo.Merge(a, b)).To(Equal(ab))
			})
		})

		It("InplaceMerge", func() {
			pairLess := func(x *Algo.Pair, y *Algo.Pair) bool {
				return x.A < y.A
			}

			pairs := []Algo.Pair{
				{8, 20},
				{8, 10},
				{10, 9},
				{10, 11},
				{10, 10},
				{20, 10},
			}

			merged := []Algo.Pair{
				{8, 20},
				{8, 10},
				{10, 9},
				{10, 11},
				{10, 10},
				{20, 10},
			}
			Algo.InplaceMerge(pairs, 3, pairLess)
			Expect(pairs).To(Equal(merged))
		})

		It("Includes", func() {
			Expect(Algo.Includes(a, b)).To(BeFalse())
			c := []int{1, 2}
			Expect(Algo.Includes(a, c)).To(BeTrue())
			d := []int{1, 2, 3, 4, 5}
			Expect(Algo.Includes(a, d)).To(BeFalse())
			Expect(Algo.Includes(a, a)).To(BeTrue())
		})

		It("SetDifference", func() {
			c := []int{1, 2}
			Expect(Algo.SetDifference(a, b)).To(Equal(c))
			d := []int{5, 6}
			Expect(Algo.SetDifference(b, a)).To(Equal(d))
		})

		It("SetIntersection", func() {
			c := []int{3, 4}
			Expect(Algo.SetIntersection(a, b)).To(Equal(c))
		})

		It("SetSymmetricDifference", func() {
			c := []int{1, 2, 5, 6}
			Expect(Algo.SetSymmetricDifference(a, b)).To(Equal(c))
		})

		It("SetUnion", func() {
			c := []int{1, 2, 3, 4, 5, 6}
			Expect(Algo.SetUnion(a, b)).To(Equal(c))
		})
	})

	Describe("MinMax", func() {
		var v []int

		BeforeEach(func() {
			v = []int{1, 2, 4, 5, -1}
		})

		It("Max", func() {
			Expect(Algo.Max(-1, 1)).To(Equal(1))
		})

		It("Min", func() {
			Expect(Algo.Min(-1, 1)).To(Equal(-1))
		})

		It("MaxElement", func() {
			Expect(v[Algo.MaxElement(v)]).To(Equal(5))
		})

		It("MinElement", func() {
			Expect(v[Algo.MinElement(v)]).To(Equal(-1))
		})

		It("MinMaxElement", func() {
			minIdx, maxIdx := Algo.MinMaxElement(v)
			Expect(v[minIdx]).To(Equal(-1))
			Expect(v[maxIdx]).To(Equal(5))
		})

		Context("LexicographicalCompare", func() {
			It("different length", func() {
				a := "abc"
				b := "abcd"
				c := "abcde"
				Expect(Algo.LexicographicalCompare(a, b)).To(BeTrue())
				Expect(Algo.LexicographicalCompare(b, c)).To(BeTrue())
				Expect(Algo.LexicographicalCompare(c, b)).To(BeFalse())
			})

			It("same length", func() {
				a := "abcd"
				b := "abce"
				Expect(Algo.LexicographicalCompare(a, a)).To(BeFalse())
				Expect(Algo.LexicographicalCompare(a, b)).To(BeTrue())
			})
		})

		It("isPermutation", func() {
			a := []int{1, 2, 5, 4, -1}
			b := []int{1, 2, 5, 5, -1}
			Expect(Algo.IsPermutation(v, a)).To(BeTrue())
			Expect(Algo.IsPermutation(a, b)).To(BeFalse())
		})

		Context("NextPermutation", func() {
			It("No permutation", func() {
				empty := []int{}
				noPermutation := []int{5, 4, 2, 1, -1}
				Expect(Algo.NextPermutation(empty)).To(BeFalse())
				Expect(Algo.NextPermutation(noPermutation)).To(BeFalse())
			})

			It("permutation", func() {
				Expect(Algo.NextPermutation(v)).To(BeTrue())
				Expect(v).To(Equal([]int{1, 2, 5, -1, 4}))
			})
		})

		It("PrevPermutation", func() {
			copyV := append([]int{}, v...)
			Expect(Algo.PrevPermutation(v)).To(BeTrue())
			Algo.NextPermutation(v)
			Expect(v).To(Equal(copyV))
		})

	})

	Describe("Numeric", func() {
		var v []int
		BeforeEach(func() {
			v = []int{1, 2, 3, 4}
		})

		It("Itoa", func() {
			res := []int{3, 4, 5, 6}
			Algo.Itoa(v, 3)
			Expect(v).To(Equal(res))
		})

		It("Accumulate", func() {
			Expect(Algo.Accumulate(v, 1, func(a int, b int) int {
				return a * b
			})).To(Equal(24))
		})

		It("InnerProduct", func() {
			Expect(Algo.InnerProduct(v, v, 0)).To(Equal(30))
		})

		It("AdjacentDifference", func() {
			Expect(Algo.AdjacentDifference(v)).To(Equal([]int{1, 1, 1, 1}))
			Expect(Algo.AdjacentDifference([]int{})).To(Equal([]int{}))
			Expect(Algo.AdjacentDifference([]int{1})).To(Equal([]int{1}))
		})

		It("PartialSum", func() {
			Expect(Algo.PartialSum(v)).To(Equal([]int{1, 3, 6, 10}))
			Expect(Algo.PartialSum([]int{})).To(Equal([]int{}))
			Expect(Algo.PartialSum([]int{1})).To(Equal([]int{1}))
		})
	})

	Describe("Partitioning", func() {
		var v []int
		var lessThan20 func(int) bool
		var notLessThan20 func(int) bool

		BeforeEach(func() {
			v = []int{10, 20, 5, 4, 3, 190}
			lessThan20 = func(x int) bool {
				return x < 20
			}
			notLessThan20 = func(x int) bool {
				return x >= 20
			}
		})

		It("IsPartitioned", func() {
			Expect(Algo.IsPartitioned(v, func(x int) bool {
				return x < 25
			})).To(BeTrue())

			Expect(Algo.IsPartitioned(v, lessThan20)).To(BeFalse())
		})

		It("Partition", func() {
			falseIdx := Algo.Partition(v, lessThan20)
			Expect(Algo.AllOf(v[:falseIdx], lessThan20)).To(BeTrue())
			Expect(Algo.AllOf(v[falseIdx:], notLessThan20)).To(BeTrue())
		})

		It("PartitionCopy", func() {
			truePart, falsePart := Algo.PartitionCopy(v, lessThan20)
			Expect(Algo.AllOf(truePart, lessThan20)).To(BeTrue())
			Expect(Algo.AllOf(falsePart, notLessThan20)).To(BeTrue())
		})

		It("StablePartition", func() {
			even := func(x int) bool {
				return x%2 == 0
			}

			before := []int{20, 10, 5, 4, 3, 1, 2}
			after := []int{20, 10, 4, 2, 5, 3, 1}
			Algo.StablePartition(before, even)
			Expect(before).To(Equal(after))

			before2 := []int{10, 2, 5, 4, 1, 3, 20}
			after2 := []int{10, 2, 4, 20, 5, 1, 3}
			Algo.StablePartition(before2, even)
			Expect(before2).To(Equal(after2))
		})

		It("PartitionPoint", func() {
			Expect(Algo.PartitionPoint(v, lessThan20)).To(Equal(1))
		})
	})
})
