import org.scalatest._

import algorithm._

class BinarySearchSpec extends FlatSpec with Matchers {

  trait Fixture {
    val a = Seq(1, 2, 3, 4)
  }

  "BinarySearch Algorithms" should "lowerBound OK" in new Fixture {
    BinarySearch.lowerBound(a, 3) should be(2)
    BinarySearch.lowerBound(a, 1) should be(0)
    BinarySearch.lowerBound(a, 5) should be(4)
  }

  it should "upperBound OK" in new Fixture {
    BinarySearch.upperBound(a, 3) should be(3)
    BinarySearch.upperBound(a, 4) should be(4)
  }

  it should "binarySearch OK" in new Fixture {
    BinarySearch.binarySearch(a, 3) should be(true)
    BinarySearch.binarySearch(a, 0) should be(false)
    BinarySearch.binarySearch(a, 5) should be(false)
  }

  it should "equalRange OK" in new Fixture {
    BinarySearch.equalRange(a, 3) should be((2, 3))
  }
}
