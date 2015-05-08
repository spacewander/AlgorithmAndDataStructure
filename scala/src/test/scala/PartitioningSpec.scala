import org.scalatest._

import collection.mutable.Seq
import algorithm._

class PartitioningSpec extends FlatSpec with Matchers {
  
  def equalN(n: Int) = (x: Int) => x == n
  trait Fixture {
    val a = Seq(3, 1, 3, 2)
    val b = Seq(3, 1)
  }

  "Partitioning Algorithms" should "isPartitioned OK" in new Fixture {
    Partitioning.isPartitioned(a, equalN(3)) should be(false)
    Partitioning.isPartitioned(b, equalN(3)) should be(true)
  }

  it should "partition OK" in new Fixture {
    Partitioning.partition(a, equalN(3))
    Partitioning.isPartitioned(a, equalN(3)) should be(true)
    Partitioning.partition(a, equalN(2))
    Partitioning.isPartitioned(a, equalN(2)) should be(true)
  }

  it should "partitionCopy OK" in new Fixture {
    val (outTrue, outFalse) = Partitioning.partitionCopy(a, equalN(3))
    outTrue should be(Seq(3, 3))
    outFalse should be(Seq(1, 2))
  }

  it should "stablePartition OK" in new Fixture {
    val out = Partitioning.stablePartition(a, equalN(3))
    out should be(Seq(3, 3, 1, 2))
  }

  it should "partitionPoint OK" in new Fixture {
    Partitioning.partitionPoint(a, equalN(3)) should be(1)
  }
}
