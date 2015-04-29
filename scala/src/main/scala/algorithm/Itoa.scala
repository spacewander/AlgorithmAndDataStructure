package algorithm

trait Itoa[T] {
  def apply() : T
  def ++() : Unit
}

class PlusOne(origin: Int) extends Itoa[Int]  {
  private var value = origin

  def apply() = value

  def ++() {
    value += 1
  }
}
