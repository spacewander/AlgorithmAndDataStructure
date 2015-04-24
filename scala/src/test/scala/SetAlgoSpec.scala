import org.scalatest._
import collection.mutable.Seq

import algorithm._

class SetAlgoSpec extends FlatSpec with Matchers {

  trait Fixture {
    var a = Seq(1, 2, 3, 4)
    var b = Seq(3, 4, 5, 6)
  }

  "Set Algorithms" should "Merge OK" in new Fixture {
    SetAlgo.Merge(a, b) should be(Seq(1, 2, 3, 4, 5, 6))
  }

  it should "Includes OK" in new Fixture {
    val c = Seq(1, 2)
    SetAlgo.Includes(a, c) should be(true)
    val d = Seq(1, 1)
    SetAlgo.Includes(a, d) should be(true)
    SetAlgo.Includes(a, b) should be(false)
  }

  it should "Union OK" in new Fixture {
    SetAlgo.Union(a, b) should be(Seq(1, 2, 3, 4, 5, 6))
  }

  it should "Difference OK" in new Fixture {
    SetAlgo.Difference(a, b) should be(Seq(1, 2))
    SetAlgo.Difference(b, a) should be(Seq(5, 6))
  }

  it should "Intersection OK" in new Fixture {
    SetAlgo.Intersection(a, b) should be(Seq(3, 4))
  }

  it should "SymmetricDifference OK" in new Fixture {
    SetAlgo.SymmetricDifference(a, b) should be(Seq(1, 2, 5, 6))
  }
}
