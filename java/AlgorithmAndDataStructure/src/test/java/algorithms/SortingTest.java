package algorithms;

import junit.framework.TestCase;

import java.util.*;

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

	public void testPartialSort() throws Exception {
		Sorting.partialSort(a, 2);
		ArrayList<Integer> partialSorted = new ArrayList<Integer>(Arrays
				.asList(1, 2));
		assertEquals(partialSorted, a.subList(0, 2));
	}

	public void testPartialSortCopy() throws Exception {
		ArrayList<Integer> b = new ArrayList<Integer>();
		Sorting.partialSortCopy(a, 2, b);
		ArrayList<Integer> partialSorted = new ArrayList<Integer>(Arrays
				.asList(1, 2));
		assertEquals(partialSorted, b);
	}

	public void testNthElement() throws Exception {
		assertEquals(Integer.valueOf(2), Sorting.nthElement(a, 2));
	}

	public void testStableSort() throws Exception {
		ArrayList list = new ArrayList();
		list.add(new AbstractMap.SimpleEntry<Integer, Character>(1, 'b'));
		list.add(new AbstractMap.SimpleEntry<Integer, Character>(3, 'a'));
		list.add(new AbstractMap.SimpleEntry<Integer, Character>(1, 'a'));
		list.add(new AbstractMap.SimpleEntry<Integer, Character>(4, 'c'));
		Sorting.stableSort(list, new Comparator<AbstractMap
				.SimpleEntry<Integer, Character>>() {
			@Override
			public int compare(AbstractMap.SimpleEntry<Integer, Character> o1,
					AbstractMap.SimpleEntry<Integer, Character> o2) {
				return o1.getKey().compareTo(o2.getKey());
			}
		});
		assertEquals(new AbstractMap.SimpleEntry<Integer, Character>(1, 'b'),
				list.get(0));
		assertEquals(new AbstractMap.SimpleEntry<Integer, Character>(1, 'a'),
				list.get(1));
	}
}