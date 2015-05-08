import org.scalatest._

import algorithm._
import collection.mutable.Seq

class MinMaxSpec extends FlatSpec with Matchers {

  trait Fixture {
    var a = Seq(2, 3, 1, 4, 5)
  }

  "MinMax Algorithms" should "max OK" in new Fixture {
    MinMax.max(2, 3) should be(3)
  }

  it should "min OK" in new Fixture {
    MinMax.min(2, 3) should be(2)
  }

  it should "minmax OK" in new Fixture {
    MinMax.minmax(2, 3) should be((2, 3))
  }

  it should "maxElement OK" in new Fixture {
    MinMax.maxElement(a) should be(5)
  }

  it should "minElement OK" in new Fixture {
    MinMax.minElement(a) should be(1)
  }

  it should "minmaxElement OK" in new Fixture {
    MinMax.minmaxElement(a) should be((1, 5))
  }

  it should "lexicographicalCompare OK" in new Fixture {
    val s1 = "abcd"
    val s2 = "abce"
    val s3 = "abc"
    MinMax.lexicographicalCompare(s1, s2) should be(true)
    MinMax.lexicographicalCompare(s1, s3) should be(false)
    MinMax.lexicographicalCompare(s3, s1) should be(true)
  }

  it should "isPermutation OK" in new Fixture {
    val b = Seq(1, 2, 3, 4, 5)
    val c = Seq(1, 2, 3, 4)
    val d = Seq(1, 2, 3, 4, 4)
    MinMax.isPermutation(a, b) should be(true)
    MinMax.isPermutation(a, c) should be(false)
    MinMax.isPermutation(a, d) should be(false)
  }

  it should "nextPermutation OK" in new Fixture {
    val permutated = Seq(2, 3, 1, 5, 4)
    MinMax.nextPermutation(a)
    a should be(permutated)
  }

  it should "prevPermutation OK" in new Fixture {
    val copy = a.clone
    MinMax.nextPermutation(a)
    MinMax.prevPermutation(a)
    a should be(copy)
  }
}
