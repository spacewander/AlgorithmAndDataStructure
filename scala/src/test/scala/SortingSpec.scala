import org.scalatest._

import algorithm._
import collection.mutable.Seq

class SortingSpec extends FlatSpec with Matchers {

  def tuple2Compare(x: Tuple2[Int, Char], y: Tuple2[Int, Char]) = {
    if (x._1 != y._1) {
      if (x._1 > y._1) 1 else -1
    }
    else {
      0
    }
  }

  trait Fixture {
    var a = Seq(3, 1, 2, 4)
    var sorted = Seq(1, 2, 3)
  }

  "Sorting Algorithms" should "IsSorted OK" in new Fixture {
    Sorting.IsSorted(a) should be(false)
    Sorting.IsSorted(sorted) should be(true)
  }

  it should "IsSortedUntil" in new Fixture {
    Sorting.IsSortedUntil(a) should be(1)
    Sorting.IsSortedUntil(sorted) should be(sorted.size)
  }

  it should "Sort OK" in new Fixture {
    Sorting.Sort(a)
    Sorting.IsSorted(a)
  }

  it should "PartialSort OK" in new Fixture {
    val partialSorted = Seq(1, 2)
    Sorting.PartialSort(a, 2).slice(0, 2) should be(partialSorted)
  }

  it should "StableSort OK" in new Fixture {
    val b = Seq(
      (1, 'b'),
      (3, 'a'),
      (1, 'a'),
      (4, 'c')
    )
    Sorting.StableSort(b, tuple2Compare)
    b(0) should be((1, 'b'))
    b(1) should be((1, 'a'))
  }

  it should "NthElement OK" in new Fixture {
    Sorting.NthElement(a, 2)
    a(0) should be(1)
    a(1) should be(2)
  }
}
