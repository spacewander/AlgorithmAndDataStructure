package algorithms;

import functionObjects.BinaryOp;
import functionObjects.Itoa;
import functionObjects.PlusOne;
import functionObjects.XPlusY;
import junit.framework.TestCase;

import java.util.ArrayList;
import java.util.Arrays;

public class NumericTest extends TestCase {
	private ArrayList<Integer> a;
	private ArrayList<Integer> b;
	private BinaryOp<Integer> xPlusY;

	public void setUp() throws Exception {
		super.setUp();
		a = new ArrayList<Integer>(Arrays.asList(1, 2, 3));
		b = new ArrayList<Integer>(Arrays.asList(4, 5, 6));
		xPlusY = new XPlusY();
	}

	public void testItoa() throws Exception {
		Itoa<Integer> itoa = new PlusOne(4);
		Numeric.itoa(a, itoa);
		assertEquals(b, a);
	}

	public void testAccumulate() throws Exception {
		assertEquals(Integer.valueOf(6), Numeric.accumulate(a, 0, xPlusY));
	}

	public void testInnerProduct() throws Exception {
		ArrayList<Integer> c = new ArrayList<Integer>(Arrays.asList(5, 7, 9));
		ArrayList<Integer> out = new ArrayList<Integer>(3);
		Numeric.innerProduct(a, b, out, xPlusY);
		assertEquals(c, out);
	}

	public void testAdjacentDifference() throws Exception {
		ArrayList<Integer> c = new ArrayList<Integer>(Arrays.asList(1, 3, 5));
		ArrayList<Integer> out = new ArrayList<Integer>(3);
		Numeric.adjacentDifference(a, out, xPlusY);
		assertEquals(c, out);
	}

	public void testPartialSum() throws Exception {
		ArrayList<Integer> c = new ArrayList<Integer>(Arrays.asList(1, 3, 6));
		ArrayList<Integer> out = new ArrayList<Integer>(3);
		Numeric.partialSum(a, out, xPlusY);
		assertEquals(c, out);
	}
}