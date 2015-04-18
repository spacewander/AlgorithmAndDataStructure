package algorithm

import collection.mutable.Iterable
import collection.mutable.Seq

/**
 * Created by lzx on 15-4-18.
 * Although this object is named with Modifying, but scala recommends people to 
 * code in functional style. So I try to implement majority of them in non-modifying way.
 */
object ModifyingSequence {
  def Copy[T](a: Iterable[T], b: Iterable[T]) = {
    (for ((x, y) <- a.zip(b)) yield y) ++ a.slice(b.size, a.size)
  }

  def CopyIf[T](a: Iterable[T], b: Iterable[T], f: T => Boolean) = {
    this.Copy(a, b.filter(f))
  }

  def CopyN[T](a: Iterable[T], b: Iterable[T], count: Int) = {
    this.Copy(a, b.take(count))
  }

  def CopyBackward[T](a: Seq[T], b: Seq[T]) = {
    val aSize = a.size
    val bSize = b.size
    if (aSize <= bSize) {
      b.slice(bSize - aSize, bSize)
    }
    else {
      a.slice(0, aSize - bSize) ++ b
    }
  }
  // Move is the same as Copy, and MoveBackward is the same as CopyBackward.

  def Fill[T](c: Iterable[T], e: T) = {
    c.map((x: T) => e)
  }

  def FillN[T](c: Seq[T], count: Int, e: T) = {
    val cSize = c.size
    if (cSize <= count) {
      this.Fill(c, e)
    }
    else {
      Seq.fill(count)(e) ++ c.slice(count, cSize)
    }
  }

  def Transform[T](c: Iterable[T], f: T => T) = {
    c.map(f)
  }

  def Generate[T](c: Seq[T], g: () => T) {
    val size = c.size
    for (i <- 0 until size)
      c(i) = g()
  }

  // instead of changing the value of the first N elements of a Sequence,
  // return a new Sequence with size of N
  def GenerateN[T](N: Int, g: () => T) = {
    for (i <- 0 until N) yield g()
  }
}
