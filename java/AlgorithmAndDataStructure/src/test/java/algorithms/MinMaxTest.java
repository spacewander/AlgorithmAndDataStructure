package algorithms;

import junit.framework.TestCase;

import java.util.ArrayList;
import java.util.Arrays;

public class MinMaxTest extends TestCase {
	private ArrayList<Integer> a;

	public void setUp() throws Exception {
		super.setUp();
		a = new ArrayList<Integer>(Arrays.asList(2, 3, 1, 4, 5));
	}

	public void testMax() throws Exception {
		assertEquals(Integer.valueOf(3), MinMax.max(2, 3));
	}

	public void testMin() throws Exception {
		assertEquals(Integer.valueOf(2), MinMax.min(2, 3));
	}

	public void testMinmax() throws Exception {
		Pair<Integer, Integer> minmax = MinMax.minmax(2, 3);
		assertEquals(Integer.valueOf(2), minmax.getFirst());
		assertEquals(Integer.valueOf(3), minmax.getSecond());
	}

	public void testMaxElement() throws Exception {
		assertEquals(Integer.valueOf(5), MinMax.maxElement(a));
	}

	public void testMinElement() throws Exception {
		assertEquals(Integer.valueOf(1), MinMax.minElement(a));
	}

	public void testMinmaxElement() throws Exception {
		Pair<Integer, Integer> minmax = MinMax.minmaxElement(a);
		assertEquals(Integer.valueOf(1), minmax.getFirst());
		assertEquals(Integer.valueOf(5), minmax.getSecond());
	}

	public void testLexicographicalCompare() throws Exception {
		String str1 = "abcd";
		String str2 = "abce";
		String str3 = "abcde";
		assert MinMax.lexicographicalCompare(str1, str2);
		assert !MinMax.lexicographicalCompare(str3, str1);
		assert MinMax.lexicographicalCompare(str1, str3);
	}

	public void testIsPermutation() throws Exception {
		ArrayList<Integer> la = new ArrayList<Integer>(Arrays.asList(1, 2, 3,
				4, 5));
		ArrayList<Integer> lb = new ArrayList<Integer>(Arrays.asList(1, 2, 3,
				4));
		ArrayList<Integer> lc = new ArrayList<Integer>(Arrays.asList(1, 2, 2,
				4, 5));
		assert MinMax.isPermutation(a, la);
		assert !MinMax.isPermutation(a, lb);
		assert !MinMax.isPermutation(a, lc);
	}

	public void testNextPermutation() throws Exception {
		ArrayList<Integer> permutated = new ArrayList<Integer>(Arrays.asList(2,
				3, 1, 5, 4));
		MinMax.nextPermutation(a);
		assertEquals(permutated, a);
	}

	public void testPrevPermutation() throws Exception {
		ArrayList<Integer> copy = new ArrayList<Integer>(a);
		MinMax.nextPermutation(a);
		MinMax.prevPermutation(a);
		assertEquals(copy, a);
	}
}