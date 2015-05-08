package algorithm

import collection.mutable.Seq

object Partitioning {
  private def swap[T](list: Seq[T], a: Int, b: Int) {
    val tmp = list(a)
    list(a) = list(b)
    list(b) = tmp
  }

  def isPartitioned[T](c: Iterable[T], f: T => Boolean) : Boolean = {
    var passedPartitionPoint = false
    for (e <- c) {
      if (passedPartitionPoint && f(e)) {
        return false
      }
      else if (!passedPartitionPoint && !f(e)){
        passedPartitionPoint = true
      }
    }
    true
  }

  def partition[T](c: Seq[T], f: T => Boolean) = {
    val end = c.size
    var start = 0
    while (start < end && f(c(start))) {
      start += 1
    }
    for (i <- start until end) {
      if (f(c(i))) {
        swap(c, i, start)
        start += 1
      }
    }
  }

  def partitionCopy[T](c: Seq[T], f: T => Boolean) = {
    var outTrue = Seq[T]()
    var outFalse = Seq[T]()
    for (e <- c) {
      if (f(e)) {
        outTrue = outTrue :+ e
      }
      else {
        outFalse = outFalse :+ e
      }
    }
    (outTrue, outFalse)
  }

  // return the index of the first element in second area
  def partitionPoint[T](c: Seq[T], f: T => Boolean) : Int = {
    for ((e, i) <- c.view.zipWithIndex) {
      if (!f(e)) {
        return i
      }
    }
    return c.size
  }

  def stablePartition[T](c: Seq[T], f: T => Boolean) = {
    val (outTrue, outFalse) = partitionCopy(c, f)
    outTrue ++ outFalse
  }
}
