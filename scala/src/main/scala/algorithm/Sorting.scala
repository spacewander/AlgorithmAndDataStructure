package algorithm

import collection.mutable.Buffer
import collection.mutable.Seq
import collection.mutable.IndexedSeq

object Sorting {
  // a compare function used by quicksort
  private def compare[T](a: T, b: T)(implicit ord: math.Ordering[T])  = {
    if (ord.equiv(a, b)) {
      0
    } 
    else {
      if (ord.gt(a, b)) 1 else -1
    }
  }

  //  a helper function which swap the value in two position of a mutable Seq
  private def swap[T](list: Seq[T], a: Int, b: Int) {
    val tmp = list(a)
    list(a) = list(b)
    list(b) = tmp
  }

  def IsSorted[T](c: Seq[T])(implicit ord: math.Ordering[T]) : Boolean = {
    val size = c.size
    for (i <- 1 until size) {
      if (ord.gt(c(i - 1), c(i))) {
        return false
      }
    }
    return true
  }

  def IsSortedUntil[T](c: Seq[T])(implicit ord: math.Ordering[T]) : Int = {
    val size = c.size
    for (i <- 1 until size) {
      if (ord.gt(c(i - 1), c(i))) {
        return i
      }
    }
    return size
  }

  def Sort[T](c: Seq[T])(implicit ord: math.Ordering[T]) {
    quicksort(c, 0, c.size - 1, compare[T])
  }

  private def quicksort[T](c: Seq[T], start: Int, 
    end: Int, cp: (T, T) => Int)(implicit ord: math.Ordering[T]) {

    if (start < end) {
      val pivot = partition(c, start, end, cp)
      quicksort(c, start, pivot - 1, cp)
      quicksort(c, pivot + 1, end, cp)
    }
  }

  private def partition[T](c: Seq[T], start: Int, 
    end: Int, cp: (T, T) => Int)(implicit ord: math.Ordering[T]) = {
    
    val sential = c(end)
    var i = start - 1
    for (j <- start until end) {
      if (cp(sential, c(j)) > 0) {
        i += 1
        swap(c, i, j)
      }
    }
    swap(c, i + 1, end)
    i + 1
  }

  def StableSort[T](c: Seq[T], 
    cp: (T, T) => Int)(implicit ord: math.Ordering[T]): Unit = {
    
    val size = c.size
    if (size <= 1)
      return 
    var pos = Seq.iterate(0, size)(x => x + 1)
    stableQuicksort(c, 0, size - 1, cp, pos)

    var from = 0
    for (to <- 1 until size) {
      if (cp(c(from), c(to)) != 0) {
        if (to - from > 1) { // optimization
          stableQuicksort(pos, from, to - 1, (x: Int, y: Int) => {
            if (x > y) 1 else 0
          }, c)
        }
        from = to
      }
    }
  }

  private def stableQuicksort[T, E](c: Seq[T], start: Int, end: Int, 
    cp: (T, T) => Int, pos: Seq[E])(implicit ord: math.Ordering[T]) {
      
    if (start < end) {
      val pivot = stablePartition(c, start, end, cp, pos)
      stableQuicksort(c, start, pivot - 1, cp, pos)
      stableQuicksort(c, pivot + 1, end, cp, pos)
    }
  }

  private def stablePartition[T, E](c: Seq[T], start: Int, end: Int, 
    cp: (T, T) => Int, pos: Seq[E])(implicit ord: math.Ordering[T]) = {
    
    val sential = c(end)
    var i = start - 1
    for (j <- start until end) {
      if (cp(c(j), sential) <= 0) {
        i += 1
        swap(c, i, j)
        swap(pos, i, j)
      }
    }
    swap(c, i + 1, end)
    swap(pos, i + 1, end)
    i + 1
  }

  def PartialSort[T](c: Seq[T],
    border: Int)(implicit ord: math.Ordering[T]) = {
    
    var tmp = c.toBuffer
    Heap.MakeHeap(tmp)
    var bound = border min c.size
    for (i <- 0 until bound) yield Heap.PopHeap(tmp)
  }

  // No need to implement PartialSortCopy
  
  // Elements in [0, n) are all less than element in n
  def NthElement[T](c: Seq[T], 
    n: Int)(implicit ord: math.Ordering[T]) : Unit = {
    
    var left = 0
    var right = c.size - 1
    while (true) {
      if (left >= n || right <= n) {
        return
      }
      val nth = quickselect(c, left, right, n)
      if (nth == n) {
        return 
      }
      if (nth < n) {
        left = nth
      }
      else {
        right = nth
      }
    }
  }

  private def quickselect[T](c: Seq[T], left: Int, right: Int, 
    border: Int)(implicit ord: math.Ordering[T]) = {
    
    swap(c, border, right)
    var idx = left
    for (i <- left until right) {
      if (ord.lt(c(i), c(right))) {
        swap(c, idx, i)
        idx += 1
      }
    }
    swap(c, idx, right)
    idx
  }
}
