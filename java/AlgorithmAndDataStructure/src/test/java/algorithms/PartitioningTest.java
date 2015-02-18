package algorithms;

import functionObjects.EqualX;
import functionObjects.UnaryPredicate;
import junit.framework.TestCase;

import java.util.ArrayList;
import java.util.Arrays;

public class PartitioningTest extends TestCase {
	private ArrayList<Integer> a;
	private ArrayList<Integer> b;
	private UnaryPredicate equalThree;

	public void setUp() throws Exception {
		super.setUp();
		a = new ArrayList<Integer>(Arrays.asList(3, 1));
		b = new ArrayList<Integer>(a);
		a.add(3);
		a.add(2);

		equalThree = new EqualX(3);
	}

	public void testIsPartitioned() throws Exception {
		assert !Partitioning.isPartitioned(a, equalThree);
		assert Partitioning.isPartitioned(b, equalThree);
	}

	public void testPartition() throws Exception {
		Partitioning.partition(a, equalThree);
		assert Partitioning.isPartitioned(a, equalThree);
	}

	public void testPartitionCopy() throws Exception {
		ArrayList<Integer> outTrue = new ArrayList<Integer>();
		ArrayList<Integer> outFalse = new ArrayList<Integer>();
		Partitioning.partitionCopy(a, outTrue, outFalse, equalThree);
		assertEquals(Integer.valueOf(3), outTrue.get(1));
		assertEquals(2, outFalse.size());
	}

	public void testStablePartition() throws Exception {
		ArrayList<Integer> partition = new ArrayList<Integer>(Arrays.asList
				(3, 3, 1, 2));
	}

	public void testPartitionPoint() throws Exception {
		assertEquals(2, Partitioning.partitionPoint(a, equalThree));
	}
}