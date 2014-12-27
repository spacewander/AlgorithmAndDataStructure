This repo is written to show the difference among each languages, and how elegant can an implementation be.
If you have a better implementation (in terms of elegance), be free to send a pull request.

## Algorithm

Implement most of C++'s STL algorithms, in various languages.

Notice 1: don't take care of the runtime efficiency. 
For example, I will use quick-sort to implement sort algorithm, instead of quick-sort + insert-sort.
Since the main idea of this repo is to show the difference among each languages(C, C++, Ruby, Javascript, ...)

Notice 2: should not directly call a function in standard library to implement it. It is cheat. 
For example, `set_difference(set1, set2)` is equal to `set1 - set2` in ruby, 
but according to this rule, I can't use `set1 - set2` to implement `set_difference`.

The list of these algorithms:

### Non-modifying sequence operations

**all_of**
**any_of**
**none_of**
   
checks if a predicate is true for all, any or none of the elements in a range 

---

**for_each**
 
applies a function to a range of elements 

---

**count**
**count_if**
 
returns the number of elements satisfying specific criteria 

---

**mismatch**
 
finds the first position where two ranges differ 

**equal**
 
determines if two sets of elements are the same 

---

**find**
**find_if**
**find_if_not**
   
finds the first element satisfying specific criteria

---

**find_end**
 
finds the last sequence of elements in a certain range 

---

**find_first_of**
 
searches for any one of a set of elements 

---

**adjacent_find**
 
finds the first two adjacent items that are equal (or satisfy a given predicate) 

---

**search**
 
searches for a range of elements 

---

**search_n**
 
searches for a number consecutive copies of an element in a range 

---

### Modifying sequence operations

**copy**
**copy_if**
   
copies a range of elements to a new location 

---

**copy_n**
   
copies a number of elements to a new location 

---

**copy_backward**
 
copies a range of elements in backwards order 

---

**move**
   
moves a range of elements to a new location 

---

**move_backward**
 
moves a range of elements to a new location in backwards order 

---

**fill**
 
assigns a range of elements a certain value 

---

**fill_n**
 
assigns a value to a number of elements 

---

**transform**
 
applies a function to a range of elements 

---

**generate**
 
saves the result of a function in a range 

---

**generate_n**
 
saves the result of N applications of a function 

---

**remove**
**remove_if**
 
removes elements satisfying specific criteria 

---

**remove_copy**
**remove_copy_if**
 
copies a range of elements omitting those that satisfy specific criteria 

---

**replace**
**replace_if**
 
replaces all values satisfying specific criteria with another value 

---

**replace_copy**
**replace_copy_if**
 
copies a range, replacing elements satisfying specific criteria with another value 

---

**swap**
 
swaps the values of two objects 

---

**swap_ranges**
 
swaps two ranges of elements 

---

**iter_swap**
 
swaps the elements pointed to by two iterators 

---

**reverse**
 
reverses the order elements in a range 

---

**reverse_copy**
 
creates a copy of a range that is reversed 

---

**rotate**
 
rotates the order of elements in a range 

---

**rotate_copy**
 
copies and rotate a range of elements 

---

**random_shuffle**
**shuffle**
   
 
randomly re-orders elements in a range 

---

**unique**
 
removes consecutive duplicate elements in a range 

---

**unique_copy**
 
creates a copy of some range of elements that contains no consecutive duplicates 

---

###Partitioning operations

**is_partitioned**
 
determines if the range is partitioned by the given predicate 

---

**partition**
 
divides a range of elements into two groups 

---

**partition_copy**
   
copies a range dividing the elements into two groups 

---

**stable_partition**
 
divides elements into two groups while preserving their relative order 

---

**partition_point**
   
locates the partition point of a partitioned range 

---

### Sorting operations

**is_sorted**
   
checks whether a range is sorted into ascending order 

---

**is_sorted_until**
 
finds the largest sorted subrange 

---

**sort**
 
sorts a range into ascending order 

---

**partial_sort**
 
sorts the first N elements of a range 

---

**partial_sort_copy**
 
copies and partially sorts a range of elements 

---

**stable_sort**
 
sorts a range of elements while preserving order between equal elements 

---

**nth_element**
 
partially sorts the given range making sure that it is partitioned by the given element 

---

### Binary search operations (on sorted ranges)

**lower_bound**
 
returns an iterator to the first element not less than the given value 

---

**upper_bound**
 
returns an iterator to the first element greater than a certain value 

---

**binary_search**
 
determines if an element exists in a certain range 

---

**equal_range**
 
returns range of elements matching a specific key 

---

### Set operations (on sorted ranges)

**merge**
 
merges two sorted ranges 

---

**inplace_merge**
 
merges two ordered ranges in-place 

---

**includes**
 
returns true if one set is a subset of another 

---

**set_difference**
 
computes the difference between two sets 

---

**set_intersection**
 
computes the intersection of two sets 

---

**set_symmetric_difference**
 
computes the symmetric difference between two sets 

---

**set_union**
 
computes the union of two sets 

---

### Heap operations

**is_heap**
   
checks if the given range is a max heap 

---

**is_heap_until**
 
finds the largest subrange that is a max heap 

---

**make_heap**
 
creates a max heap out of a range of elements 

---

**push_heap**
 
adds an element to a max heap 

---

**pop_heap**
 
removes the largest element from a max heap 

---

**sort_heap**
 
turns a max heap into a range of elements sorted in ascending order 

---

### Minimum/maximum operations

**max**
 
returns the larger of two elements 

---

**max_element**
 
returns the largest element in a range 

---

**min**
 
returns the smaller of two elements 

---

**min_element**
 
returns the smallest element in a range 

---

**minmax**
   
returns the larger and the smaller of two elements 

---

**minmax_element**
 
returns the smallest and the largest element in a range 

---

**lexicographical_compare**
 
returns true if one range is lexicographically less than another 

---

**is_permutation**
 
determines if a sequence is a permutation of another sequence 

---

**next_permutation**
 
generates the next greater lexicographic permutation of a range of elements 

---

**prev_permutation**
 
generates the next smaller lexicographic permutation of a range of elements 

---

### Numeric operations

**iota**
   
fills a range with successive increments of the starting value 

---

**accumulate**
 
sums up a range of elements 

---

**inner_product**
 
computes the inner product of two ranges of elements 

---

**adjacent_difference**
 
computes the differences between adjacent elements in a range 

---

**partial_sum**
 
computes the partial sum of a range of elements 

