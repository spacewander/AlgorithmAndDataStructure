package main_test

import (
	Algo "AlgorithmAndDataStructure"

	. "github.com/onsi/ginkgo"
	. "github.com/onsi/gomega"
)

var _ = Describe("AlgorithmAndDataStructure", func() {

	Describe("non_modifying_sequence", func() {
		var a []int

		BeforeEach(func() {
			a = []int{1, 2, 3}
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

		It("Equal", func() {
			same := []int{1, 2, 3}
			Expect(Algo.Equal(a, same, func(first int, second int) bool {
				return first == second
			})).To(BeTrue())
		})

	})
})
