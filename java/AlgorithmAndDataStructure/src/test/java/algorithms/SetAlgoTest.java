package algorithms;

import junit.framework.TestCase;

import java.util.ArrayList;
import java.util.Arrays;

public class SetAlgoTest extends TestCase {
	private ArrayList<Integer> a;
	private ArrayList<Integer> b;
	private ArrayList<Integer> aWithB;
	private ArrayList<Integer> exp;

	public void setUp() throws Exception {
		super.setUp();
		a = new ArrayList<Integer>(Arrays.asList(1, 2));
		b = new ArrayList<Integer>(Arrays.asList(2, 3));
		aWithB = new ArrayList<Integer>(Arrays.asList(1, 2, 3));
		exp = new ArrayList<Integer>();
	}

	public void testMerge() throws Exception {
		assertEquals(aWithB, SetAlgo.merge(a, b));
	}

	public void testInplaceMerge() throws Exception {
		SetAlgo.inplaceMerge(a, b);
		assertEquals(aWithB, a);
	}

	public void testIncludes() throws Exception {
		assert !SetAlgo.includes(a, b);
		b.remove(Integer.valueOf(3));
		assert SetAlgo.includes(a, b);
	}

	public void testUnion() throws Exception {
		assertEquals(aWithB, SetAlgo.union(a, b));
	}

	public void testDifference() throws Exception {
		exp.add(1);
		assertEquals(exp, SetAlgo.difference(a, b));
	}

	public void testIntersection() throws Exception {
		exp.add(2);
		assertEquals(exp, SetAlgo.intersection(a, b));
	}

	public void testSymmetricDifference() throws Exception {
		exp.add(1);
		exp.add(3);
		assertEquals(exp, SetAlgo.symmetricDifference(a, b));
	}
}