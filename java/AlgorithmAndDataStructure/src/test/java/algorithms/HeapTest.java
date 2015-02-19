package algorithms;

import junit.framework.TestCase;

import java.util.ArrayList;
import java.util.Arrays;

public class HeapTest extends TestCase {
	private ArrayList<Integer> a;
	private ArrayList<Integer> heap;

	public void setUp() throws Exception {
		super.setUp();
		a = new ArrayList<Integer>(Arrays.asList(2, 3, 1, 4, 5));
		heap = new ArrayList<Integer>(Arrays.asList(1, 2, 3, 4));
	}

	public void testIsHeap() throws Exception {
		assert !Heap.isHeap(a);
		assert Heap.isHeap(heap);
	}

	public void testIsHeapUntil() throws Exception {
		assertEquals(2, Heap.isHeapUntil(a));
	}

	public void testMakeHeap() throws Exception {
		Heap.makeHeap(a);
		assert Heap.isHeap(a);
	}

	public void testPopHeap() throws Exception {
		Integer out = Heap.popHeap(heap);
		assertEquals(Integer.valueOf(1), out);
		assert Heap.isHeap(heap);
	}

	public void testPushHeap() throws Exception {
		Heap.pushHeap(heap, 7);
		assert Heap.isHeap(heap);
	}

	public void testSortHeap() throws Exception {
		ArrayList<Integer> sorted = new ArrayList<Integer>(Arrays.asList(1,
				2, 3, 4, 5));
		Heap.sortHeap(a);
		assertEquals(sorted, a);
	}
}