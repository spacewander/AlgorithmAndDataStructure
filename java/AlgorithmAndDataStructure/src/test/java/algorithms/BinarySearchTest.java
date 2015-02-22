package algorithms;

import junit.framework.TestCase;

import java.util.ArrayList;
import java.util.Arrays;

public class BinarySearchTest extends TestCase {
	private ArrayList<Integer> a;

	public void setUp() throws Exception {
		super.setUp();
		a = new ArrayList<Integer>(Arrays.asList(1, 2, 3, 4));
	}

	public void testLowerBound() throws Exception {
		assertEquals(2, BinarySearch.lowerBound(a, 3));
		assertEquals(0, BinarySearch.lowerBound(a, 1));
		assertEquals(4, BinarySearch.lowerBound(a, 5));
	}

	public void testUpperBound() throws Exception {
		assertEquals(3, BinarySearch.upperBound(a, 3));
		assertEquals(4, BinarySearch.upperBound(a, 4));
	}

	public void testBinarySearch() throws Exception {
		assert BinarySearch.binarySearch(a, 3);
		assert !BinarySearch.binarySearch(a, 0);
		assert !BinarySearch.binarySearch(a, 5);
	}

	public void testEqualRange() throws Exception {
		Pair equalThree = BinarySearch.equalRange(a, 3);
		assertEquals(2, equalThree.getFirst());
		assertEquals(3, equalThree.getSecond());
	}
}