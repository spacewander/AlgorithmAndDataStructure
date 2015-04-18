import org.scalatest._
import collection.mutable.ArrayBuffer

import algorithm._

class ModifyingSequenceSpec extends FlatSpec with Matchers {

  def isEven(x: Int) : Boolean = x % 2 == 0
  def beOne() : Int = 1

  trait Fixture {
    var a = ArrayBuffer(1, 1)
    var b = ArrayBuffer(2, 3)
    val empty : ArrayBuffer[Int] = ArrayBuffer()
  }

  "Modifying Sequence Algorithms" should "Copy OK" in new Fixture {
    ModifyingSequence.Copy(a, b) should be(ArrayBuffer(2, 3))
  }

  it should "CopyIf OK" in new Fixture {
    ModifyingSequence.CopyIf(a, b, isEven) should be(ArrayBuffer(2, 1))
    ModifyingSequence.CopyIf(a, b, (x: Int) => false) should be(a)
    ModifyingSequence.CopyIf(a, empty, isEven) should be(a)
  }

  it should "CopyN OK" in new Fixture {
    ModifyingSequence.CopyN(a, empty, 2) should be(ArrayBuffer(1, 1))
    ModifyingSequence.CopyN(a, b, 1) should be(ArrayBuffer(2, 1))
    ModifyingSequence.CopyN(a, b, 3) should be(ArrayBuffer(2, 3))
  }

  it should "CopyBackward OK" in new Fixture {
    val short = ArrayBuffer(2)
    val long = ArrayBuffer(1, 2, 3)
    ModifyingSequence.CopyBackward(a, short) should be(ArrayBuffer(1, 2))
    ModifyingSequence.CopyBackward(a, long) should be(ArrayBuffer(2, 3))
  }

  it should "Fill OK" in new Fixture {
    ModifyingSequence.Fill(empty, 3) should be(empty)
    ModifyingSequence.Fill(a, 3) should be(ArrayBuffer(3, 3))
  }

  it should "FillN OK" in new Fixture {
    ModifyingSequence.FillN(empty, 2, 1) should be(empty)
    ModifyingSequence.FillN(a, 3, 2) should be(ArrayBuffer(2, 2))
    ModifyingSequence.FillN(a, 1, 2) should be(ArrayBuffer(2, 1))
  }

  it should "Transform" in new Fixture {
    def plusOne = (x: Int) => x + 1
    ModifyingSequence.Transform(a, plusOne) should be(ArrayBuffer(2, 2))
  }

  it should "Generate" in new Fixture {
    ModifyingSequence.Generate(b, beOne) 
    b should be(ArrayBuffer(1, 1))
  }

  it should "GenerateN" in new Fixture {
    val seq = ModifyingSequence.GenerateN(3, beOne) 
    seq should contain only(1)
    seq should have size 3
  }
}
