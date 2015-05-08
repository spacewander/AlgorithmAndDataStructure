package algorithm

object BinarySearch {
  def lowerBound[T](c: Seq[T], value: T)(implicit ord: math.Ordering[T]) = {
    var guess = c.size
    var start = 0
    while (guess > 0) {
      var i = start
      i += guess / 2
      if (ord.lt(c(i), value)) {
        start = i + 1
        guess = guess / 2 - 1
      }
      else {
        guess = guess / 2
      }
    }
    start
  }

  def upperBound[T](c: Seq[T], value: T)(implicit ord: math.Ordering[T]) = {
    var guess = c.size
    var start = 0
    while (guess > 0) {
      var i = start
      i += guess / 2
      if (ord.lteq(c(i), value)) {
        start = i + 1
        guess = guess / 2 - 1
      }
      else {
        guess = guess / 2
      }
    }
    start
  }

  def binarySearch[T](c: Seq[T], value: T)(implicit ord: math.Ordering[T]) = {
    val i = lowerBound[T](c, value)
    i != c.size && ord.equiv(c(i), value)
  }

  def equalRange[T](c: Seq[T], value: T)(implicit ord: math.Ordering[T]) = {
    (lowerBound[T](c, value), upperBound[T](c, value))
  }
}
