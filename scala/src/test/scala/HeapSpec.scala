import org.scalatest._

import algorithm._
import collection.mutable.Buffer

class HeapSpec extends FlatSpec with Matchers {
  
  trait Fixture {
    var a = Buffer(2, 3, 1, 4, 5)
    var heap = Buffer(1, 2, 3, 4)
  }

  "Heap Algorithms" should "IsHeap OK" in new Fixture {
    Heap.IsHeap(a) should be(false)
    Heap.IsHeap(heap) should be(true)
  }

  it should "IsHeapUntil OK" in new Fixture {
    Heap.IsHeapUntil(a) should be(2)
  }

  it should "MakeHeap OK" in new Fixture {
    Heap.IsHeap(Heap.MakeHeap(a)) should be(true)
  }

  it should "PopHeap OK" in new Fixture {
    Heap.PopHeap(heap) should be(1)
    heap.size should be(3)
    Heap.IsHeap(heap) should be(true)
  }

  it should "PushHeap OK" in new Fixture {
    Heap.PushHeap(heap, 1)
    heap.size should be(5)
    Heap.IsHeap(heap) should be(true)
  }

  it should "SortHeap OK" in new Fixture {
    val sorted = Buffer(1, 2, 3, 4, 5)
    Heap.SortHeap(Heap.MakeHeap(a)) should be(sorted)
  }
} 
