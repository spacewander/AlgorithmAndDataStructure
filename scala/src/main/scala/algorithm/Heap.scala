package algorithm

import collection.mutable.Buffer

object Heap {
  def IsHeap[T](c: Buffer[T])(implicit ord: math.Ordering[T]) : Boolean = {
    val size = c.size
    if (size < 1)
      return true
    for (i <- 1 until size) {
      if (ord.lt(c(i), c((i-1) / 2)))
        return false
    }
    return true
  }

  def IsHeapUntil[T](c: Buffer[T])(implicit ord: math.Ordering[T]) : Int = {
    val size = c.size
    if (size < 1)
      return 0
    for (i <- 1 until size) {
      if (ord.lt(c(i), c((i-1) / 2)))
        return i
    }
    return size
  }

  // Make a min heap. Modify given Buffer and return it back
  def MakeHeap[T](c: Buffer[T])(implicit ord: math.Ordering[T]) = {
    val size = c.size
    var continue = true
    var i = size / 2 - 1
    while (i >= 0) {
      while (continue) {
        val left = 2 * i + 1;
        if (left >= size)
          continue = false
        else {
          var smallest = if (ord.lt(c(left), c(i))) left else i
          val right = left + 1
          if (right < size)
            smallest = if (ord.lt(c(right), c(smallest))) right else smallest
          if (!ord.equiv(c(smallest), c(i))) {
            val tmp = c(smallest)
            c(smallest) = c(i)
            c(i) = tmp
            i = smallest
          }
          else {
            continue = false
          }
        }
      }
      continue = true
      i -= 1
    }
    c
  }

  def PopHeap[T](c: Buffer[T])(implicit ord: math.Ordering[T]) = {
    val tmp = c.remove(0)
    MakeHeap(c)
    tmp
  }

  def PushHeap[T](c: Buffer[T], value: T)(implicit ord: math.Ordering[T]) {
    c += value
    MakeHeap(c)
  }

  def SortHeap[T](c: Buffer[T])(implicit ord: math.Ordering[T]) = {
    val sorted : Buffer[T] = Buffer()
    val size = c.size
    for (i <- 0 until size) {
      sorted += PopHeap(c)
    }
    sorted
  }
}
