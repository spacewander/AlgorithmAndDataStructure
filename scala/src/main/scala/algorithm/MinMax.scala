package algorithm

import collection.mutable.Seq

object MinMax {
  def max[T](a: T, b: T)(implicit ord: math.Ordering[T]) = {
    if (ord.gt(a, b)) a else b
  }

  def min[T](a: T, b: T)(implicit ord: math.Ordering[T]) = {
    if (ord.lt(a, b)) a else b
  }

  def minmax[T](a: T, b: T)(implicit ord: math.Ordering[T]) = {
    if (ord.lt(a, b)) (a, b) else (b, a)
  }

  def minElement[T](c: Iterable[T])(implicit ord: math.Ordering[T]) = {
    c.reduce(min[T])
  }

  def maxElement[T](c: Iterable[T])(implicit ord: math.Ordering[T]) = {
    c.reduce(max[T])
  }

  def minmaxElement[T](c: Iterable[T])(implicit ord: math.Ordering[T]) = {
    (c.reduce(min[T]), c.reduce(max[T]))
  }
  
  def lexicographicalCompare[T](a: String, b: String) : Boolean = {
    if (a.size != b.size)
      return a.size <= b.size
    for (ch1 <- a; ch2 <- b) {
      if (ch1 != ch2)
        return ch1 < ch2
    }
    return true
  }

  def isPermutation[T](a: Seq[T], b: Seq[T]): Boolean = {
    if (a.size != b.size)
      return false
    val elements = new collection.mutable.HashMap[T, Int]
    for (e <- a) {
      elements(e) = if (elements.contains(e)) elements(e) + 1 else 1
    }
    for (e <- b) {
      if (elements.contains(e) && elements(e) > 0) {
        elements(e) = elements(e) - 1
      }
      else {
        return false
      }
    }
    return true
  }

  private def swap[T](c: Seq[T], a: Int, b: Int) {
    val tmp = c(a)
    c(a) = c(b)
    c(b) = tmp
  }

  def nextPermutation[T](c: Seq[T])(implicit 
    ord: math.Ordering[T]) : Boolean = {

    val size = c.size
    if (size <= 1)
      return false
    var i = size - 1
    while (true) {
      val pos1 = i
      i -= 1
      if (ord.lt(c(i), c(pos1))) {
        var pos2 = size - 1
        while (ord.lt(c(pos2), c(i))) {
          pos2 -= 1
        }
        swap(c, i, pos2)
        val pivot = (size - pos1) / 2
        for (j <- 0 until pivot)
          swap(c, pos1 + j, size - j - 1)
        return true
      }
      if (i == 0) {
        ModifyingSequence.Reverse(c)
        return false
      }
    }
    return false
  }

  def prevPermutation[T](c: Seq[T])(implicit 
    ord: math.Ordering[T]) : Boolean = {

    val size = c.size
    if (size <= 1)
      return false
    var i = size - 1
    while (true) {
      val pos1 = i
      i -= 1
      if (ord.lt(c(pos1), c(i))) {
        var pos2 = size - 1
        while (ord.lt(c(i), c(pos2))) {
          pos2 -= 1
        }
        swap(c, i, pos2)
        val pivot = (size - pos1) / 2
        for (j <- 0 until pivot)
          swap(c, pos1 + j, size - j - 1)
        return true
      }
      if (i == 0) {
        ModifyingSequence.Reverse(c)
        return false
      }
    }
    return false
  }
}
