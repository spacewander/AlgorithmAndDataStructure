package algorithm

object SetAlgo {
  def Merge[T](a: Seq[T], b: Seq[T]) = {
    (a ++ b).distinct
  }
  // No InplaceMerge please, the Merge is enough
  def Includes[T](a: Seq[T], b: Seq[T]) = {
    val outer = a.toSet
    val inner = b.toSet
    (outer | inner) == outer
  }

  // act the same as Merge
  def Union[T](a: Seq[T], b: Seq[T]) = {
    (a ++ b).distinct
  }

  def Difference[T](a: Seq[T], b: Seq[T]) = {
    val unwanted = b.toSet
    a.filterNot(unwanted)
  }

  def Intersection[T](a: Seq[T], b: Seq[T]) = {
    val wanted = b.toSet
    a.filter(wanted)
  }

  def SymmetricDifference[T](a: Seq[T], b: Seq[T]) = {
    Difference(a, b) ++ Difference(b, a)
  }
}
