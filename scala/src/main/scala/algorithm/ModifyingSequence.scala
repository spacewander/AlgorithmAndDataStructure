package algorithm

import collection.mutable.ArrayBuffer
import collection.mutable.Iterable
import collection.mutable.Seq
import util.Random

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
    for (i <- 0 until c.size)
      c(i) = g()
  }

  // instead of changing the value of the first N elements of a Sequence,
  // return a new Sequence with size of N
  def GenerateN[T](N: Int, g: () => T) = {
    for (i <- 0 until N) yield g()
  }

  def Remove[T](c: Iterable[T], value: T) = {
    c.filter((x: T) => x != value)
  }

  def RemoveIf[T](c: Iterable[T], f: T => Boolean) = {
    c.filterNot(f)
  }

  // return two Iterable, one is elements removed, the other is elements remained
  def RemoveCopyIf[T](c: Iterable[T], f: T => Boolean) = {
    c.partition(f)
  }

  def RemoveCopy[T](c: Iterable[T], value: T) = {
    this.RemoveCopyIf(c, (x: T) => x == value)
  }

  def Replace[T](c: Seq[T], before: T, after: T) {
    for (i <- 0 until c.size) {
      if (c(i) == before) {
        c(i) = after
      }
    }
  }

  def ReplaceIf[T](c: Seq[T], f: T => Boolean, after: T) {
    for (i <- 0 until c.size) {
      if (f(c(i))) {
        c(i) = after
      }
    }
  }

  def ReplaceCopy[T](c: Seq[T], before: T, after: T) = {
    c.map((x: T) => if (x == before) after else x)
  }

  def ReplaceCopyIf[T](c: Seq[T], f: T => Boolean, after: T) = {
    c.map((x: T) => if (f(x)) after else x)
  }

  def RangeSwap[T](a: Seq[T], b: Seq[T]) {
    var i = 0
    for ((x, y) <- a.zip(b)) {
      a(i) = y
      b(i) = x
      i += 1
    }
  }

  def Reverse[T](c: Seq[T]) {
    val size = c.size - 1
    val middle = (size + 1) / 2
    for (i <- 0 until middle) {
      val tmp = c(i)
      c(i) = c(size - i)
      c(size - i) = tmp
    }
  }

  def ReverseCopy[T](c: Seq[T]) = {
    c.reverseMap((x: T) => x)
  }

  def Rotate[T](c: Seq[T], dist: Int) {
    val cSize = c.size
    if (cSize != 0 && dist != 0) {
      var idx = -dist % cSize
      if (idx < 0)
        idx += cSize
      val pivot1 = idx / 2
      for (i <- 0 until pivot1) {
        val tmp = c(i)
        c(i) = c(idx - i - 1)
        c(idx - i - 1) = tmp
      }
      val pivot2 = (cSize + idx) / 2
      for (i <- idx until pivot2) {
        val tmp = c(i)
        c(i) = c(cSize - 1 - i + idx)
        c(cSize - 1 - i + idx) = tmp
      }
      this.Reverse(c)
    }
  }

  def RotateCopy[T](c: Seq[T], dist: Int) = {
    val cSize = c.size
    var idx = (cSize - dist) % cSize
    if (idx < 0)
      idx = idx + cSize
    c.slice(idx, cSize) ++ c.slice(0, idx)
  }

  def Shuffle[T](c: Seq[T]) = {
    val rd = new Random()
    val size = c.size
    for (i <- 0 until size) {
      val randNum = rd.nextInt(size)
      val tmp = c(i)
      c(i) = c(randNum)
      c(randNum) = tmp
    }
    c
  }

  // works like distince
  def UniqueCopy[T](c: Seq[T]) =  {
    if (c.size <= 1) {
      c
    }
    else {
      var head = c.head
      var start = head 
      val f = (x: T) => {
        if (x != head) {
          head = x
          true
        }
        else {
          false
        }
      }
      start +: c.filter(f)
    }
  }

  def Unique[T](c: ArrayBuffer[T]) {
    val uniq = this.UniqueCopy(c)
    c.clear
    c.appendAll(uniq)
  }
}
