import org.scalatest._
import collection.mutable.Seq

import algorithm._

class NumericSpec extends FlatSpec with Matchers {

  def xPlusY = (x: Int, y: Int) => x + y

  trait Fixture {
    var a = Seq(1, 2, 3)
    var b = Seq(4, 5, 6)
  }

  "Numeric Algorithms" should "Itoa OK" in new Fixture {
    val itoa = new PlusOne(4)
    Numeric.Itoa(a, itoa)
    a should be(b)
  }

  it should "Accumulate OK" in new Fixture {
    Numeric.Accumulate(a, 2, xPlusY) should be(8)
  }

  it should "InnerProduct OK" in new Fixture {
    val c = Seq(5, 7, 9)
    Numeric.InnerProduct(a, b, xPlusY) should be(c)
  }

  it should "AdjacentOp OK" in new Fixture {
    val c = Seq(1, 3, 5)
    Numeric.AdjacentOp(a, xPlusY) should be(c)
  }

  it should "PartialReduce OK" in new Fixture {
    val c = Seq(4, 9, 15)
    Numeric.PartialReduce(b, xPlusY) should be(c)
  }
}
