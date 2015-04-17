import org.scalatest._
import collection.mutable.ArrayBuffer

import algorithm._

class NonModifyingSequenceSpec extends FlatSpec with Matchers {

  def lessThan(x: Int): Int => Boolean = (y: Int) => y < x
  def isEqual(x: Int): Int => Boolean = (y: Int) => y == x
  def equalEach(x: Int, y: Int) : Boolean = x == y

  trait Fixture {
    val list = Seq(1, 1, 2, 3)
  }

  "Non Modifying Sequence Algorithms" should "AnyOf OK" in new Fixture {
    NonModifyingSequence.AnyOf(list, lessThan(0)) shouldBe(false)
    NonModifyingSequence.AnyOf(list, lessThan(4)) shouldBe(true)
    NonModifyingSequence.AnyOf(list, lessThan(2)) shouldBe(true)
  }

  it should "AllOf OK" in new Fixture {
    NonModifyingSequence.AllOf(list, lessThan(4)) shouldBe(true)
    NonModifyingSequence.AllOf(list, lessThan(2)) shouldBe(false)
  }

  it should "NoneOf OK" in new Fixture {
    NonModifyingSequence.NoneOf(list, lessThan(2)) shouldBe(false)
    NonModifyingSequence.NoneOf(list, lessThan(0)) shouldBe(true)
  }

  it should "ForEach OK" in new Fixture {
    var ary = ArrayBuffer(0)
    def appendToAry(e: Int) {
      ary += e
    }
    NonModifyingSequence.ForEach(list, appendToAry)
    ary should be(ArrayBuffer(0, 1, 1, 2, 3))
  }

  it should "Count OK" in new Fixture {
    NonModifyingSequence.Count(list, 1) should be(2)
    NonModifyingSequence.Count(list, 4) should be(0)
  }

  it should "CountIf OK" in new Fixture {
    NonModifyingSequence.CountIf(list, isEqual(1)) should be(2)
    NonModifyingSequence.CountIf(list, isEqual(-1)) should be(0)
    NonModifyingSequence.CountIf(list, lessThan(2)) should be(2)
  }

  it should "Mismatch OK" in new Fixture {
    val copy = Seq(1, 1, 2, 3)
    val less = Seq(1, 1, 2)
    val more = Seq(1, 1, 2, 3, 4)
    val mis = Seq(1, 2, 2, 3)

    NonModifyingSequence.Mismatch(list, copy, equalEach) should be((None, None))
    NonModifyingSequence.Mismatch(list, less,
      equalEach) should be((Some(3), None))
    NonModifyingSequence.Mismatch(list, more,
      equalEach) should be((None, Some(4)))
    NonModifyingSequence.Mismatch(list, mis,
      equalEach) should be((Some(1), Some(2)))
  }

  it should "Equal OK" in new Fixture {
    val copy = Seq(1, 1, 2, 3)
    val other = Seq(1, 1, 2)
    NonModifyingSequence.Equal(list, copy, equalEach) shouldBe(true)
    NonModifyingSequence.Equal(list, other, equalEach) shouldBe(false)
  }

  it should "Find Ok" in new Fixture {
    NonModifyingSequence.Find(list, 3) should be(Some(3))
    NonModifyingSequence.Find(list, 4) should be(None)
  }

  it should "FindIf Ok" in new Fixture {
    NonModifyingSequence.FindIf(list, lessThan(2)) should be(Some(1))
    NonModifyingSequence.FindIf(list, lessThan(1)) should be(None)
  }

  it should "FindIFNot Ok" in new Fixture {
    NonModifyingSequence.FindIFNot(list, lessThan(2)) should be(Some(2))
    NonModifyingSequence.FindIFNot(list, lessThan(4)) should be(None)
  }

  it should "FindFirstOf OK" in new Fixture {
    val other = Seq(5, 6, 7)
    NonModifyingSequence.FindFirstOf(list, other, equalEach) should be(None)
    val found = Seq(1, 4, 2)
    NonModifyingSequence.FindFirstOf(list, found, equalEach) should be(Some(1))
    val empty : Seq[Int] = Seq()
    NonModifyingSequence.FindFirstOf(list, empty, equalEach) should be(None)
  }

  it should "FindEnd OK" in new Fixture {
    val seq = Seq(1, 2, 1, 2, 1)
    val target = Seq(1, 2)
    NonModifyingSequence.FindEnd(seq, target, equalEach) should be(2)
    val empty : Seq[Int] = Seq()
    NonModifyingSequence.FindEnd(seq, empty, equalEach) should be(0)
    val long = Seq(1, 1, 2, 1, 2, 1)
    NonModifyingSequence.FindEnd(seq, long, equalEach) should be(-1)
  }
  it should "AdjacentFind OK" in new Fixture {
    NonModifyingSequence.AdjacentFind(list, equalEach) should be(Some(1))
    val empty : Seq[Int] = Seq()
    NonModifyingSequence.AdjacentFind(empty, equalEach) should be(None)
    val short = Seq(1)
    NonModifyingSequence.AdjacentFind(short, equalEach) should be(None)
  }

  it should "Search OK" in new Fixture {
    val tmp = Seq(1, 1)
    NonModifyingSequence.Search(list, tmp, equalEach) should be(0)
    NonModifyingSequence.Search(tmp, list, equalEach) should be(tmp.size)
    val mis = Seq(1, 0, 2)
    NonModifyingSequence.Search(list, mis, equalEach) should be(list.size)
  }

  it should "SearchN OK" in new Fixture {
    NonModifyingSequence.SearchN(list, 2, 1, equalEach) should be(0)
    NonModifyingSequence.SearchN(list, 2, 2, equalEach) should be(list.size)
  }
}
