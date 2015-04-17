package algorithm

/**
 * Created by lzx on 15-4-16.
 */
object NonModifyingSequence {
  def AnyOf[T](c: Iterable[T], f: T => Boolean)  = {
    c.exists(f)
  }

  def AllOf[T](c: Iterable[T], f: T => Boolean) = {
    c.forall(f)
  }

  def NoneOf[T](c: Iterable[T], f: T => Boolean) = {
    val notF = (x: T) => !f(x)
    c.forall(notF)
  }

  def ForEach[T](c: Iterable[T], f: T => Unit): Unit = {
    for (e <- c) {
      f(e)
    }
  }

  def CountIf[T](c: Iterable[T], f: T => Boolean) = {
    var counter = 0
    for (e <- c) {
      if (f(e))
        counter += 1
    }
    counter
  }

  def Count[T](c: Iterable[T], value: T) = {
    this.CountIf(c, (x: T) => x == value)
  }

  def Mismatch[T](a: Iterable[T], b: Iterable[T], 
    f: (T, T) => Boolean) : (Option[T], Option[T]) = {

    val x = a.toIterator
    val y = b.toIterator
    while (x.hasNext && y.hasNext) {
      val v1 = x.next
      val v2 = y.next
      if (!f(v1, v2))
        return (Some(v1), Some(v2))
    }
    if (x.hasNext) {
      return (Some(x.next), None)
    }
    else if (y.hasNext) {
      return (None, Some(y.next))
    }
    else {
      return (None, None)
    }
  }

  def Equal[T](a: Iterable[T], b: Iterable[T], 
    f: (T, T) => Boolean) : Boolean = {

    val lenA = a.size
    val lenB = b.size
    if (lenA != lenB)
      return false
    for ((x, y) <- a.zip(b)) {
      if (!f(x, y))
        return false
    }
    return true
  }

  def FindIf[T](c: Iterable[T], f: T => Boolean) : Option[T] = {
      for (i <- c) {
        if (f(i))
          return Some(i)
      }
      return None
  }

  def Find[T](c: Iterable[T], value: T) : Option[T] = {
    this.FindIf(c, (x: T) => x == value)
  } 

  def FindIFNot[T](c: Iterable[T], f: T => Boolean) : Option[T] = {
    this.FindIf(c, (x: T) => !f(x))
  }

  // find the first occurence of elements in Iterable b in Iterable a
  def FindFirstOf[T](a: Iterable[T], b: Iterable[T], 
    f: (T, T) => Boolean) : Option[T] = {

    for (i <- b; j <- a) {
      if (f(i, j))
        return Some(i)
    }
    return None
  }

  // find two adjacent elements which satisfy f
  def AdjacentFind[T](c: Iterable[T], f: (T, T) => Boolean) : Option[T] = {
    if (c.size == 0) {
      return None
    }
    val tail = c.tail
    for ((x, y) <- c.zip(tail)) {
      if (f(x, y))
        return Some(x)
    }
    return None
  }

  // if there is a range of elements satisfy f with corresponding element in b,
  // return the start of range; else return the size of a
  def Search[T](a: Seq[T], b: Seq[T], f: (T, T) => Boolean) : Int = {
    val aSize = a.size
    val bSize = b.size
    var j = 0
    var conflict = false
    if (bSize == 0)
      return 0
    for (i <- 0 until aSize - bSize) {
      for (k <- i until aSize if !conflict) {
        if (!f(a(k), b(j))) {
          j = 0
          conflict = true
        }
        else {
          j += 1
          if (j == bSize)
            return i
        }
      }
      conflict = false
    }
    return aSize
  }

  def SearchN[T](a: Seq[T], count: Int, value: T, 
    f: (T, T) => Boolean) : Int = {
      if (count <= 0)
        return 0
      val b = Seq.fill(count)(value)
      this.Search(a, b, f)
  }

  // another Search, find the first range from back to front. If no range 
  // found, return -1
  def FindEnd[T](a: Seq[T], b: Seq[T], f: (T, T) => Boolean) : Int = {
    val aSize = a.size
    val bSize = b.size
    var conflict = false
    var j = 0
    if (bSize == 0)
      return 0
    for (i <- aSize - bSize - 1 to (0, -1)) {
      for (k <- i to aSize - 1 if !conflict) {
        if (!f(a(k), b(j))) {
          j = 0
          conflict = true
        }
        else {
          j += 1
          if (j == bSize)
            return i
        }
      }
      conflict = false
    }
    return -1
  }
}
