package algorithms;

import junit.framework.TestCase;

import java.util.ArrayList;
import java.util.Arrays;

public class SortingTest extends TestCase {
	private ArrayList<Integer> a;
	private ArrayList<Integer> sorted;

	public void setUp() throws Exception {
		super.setUp();
		a = new ArrayList<Integer>(Arrays.asList(3, 1, 2, 4));
		sorted = new ArrayList<Integer>(Arrays.asList(1, 2, 3));
	}

	public void testIsSorted() throws Exception {
		assert !Sorting.isSorted(a);
		assert Sorting.isSorted(sorted);
	}

	public void testIsSortedUntil() throws Exception {
		assertEquals(1, Sorting.isSortedUntil(a).nextIndex());
	}

	public void testSort() throws Exception {
		Sorting.sort(a);
		assert Sorting.isSorted(a);
	}
}