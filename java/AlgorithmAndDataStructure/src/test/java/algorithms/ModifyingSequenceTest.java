package algorithms;

import functionObjects.EqualX;
import functionObjects.Nullify;
import functionObjects.Repeater;
import junit.framework.TestCase;

import java.util.ArrayList;
import java.util.Collections;

public class ModifyingSequenceTest extends TestCase {
	private ArrayList<Integer> a, b;
	private EqualX equalThree;

	public void setUp() throws Exception {
		super.setUp();
		a = new ArrayList<Integer>();
		a.add(1);
		a.add(2);
		a.add(3);
		b = new ArrayList<Integer>();
		equalThree = new EqualX(3);
	}

	public void testCopy() throws Exception {
		ModifyingSequence.copy(a, b);
		assertEquals(a, b);
	}

	public void testCopy_if() throws Exception {
		ModifyingSequence.copy_if(a, b, equalThree);
		assertEquals(Integer.valueOf(3), b.get(0));
	}

	public void testCopy_n() throws Exception {
		ModifyingSequence.copy_n(a, 2, b);
		assertEquals(2, b.size());
		assertEquals(Integer.valueOf(2), b.get(1));
	}

	public void testCopy_backward() throws Exception {
		b.add(2);
		b.add(1);
		ModifyingSequence.copy_backward(a, b);
		assertEquals(Integer.valueOf(2), b.get(0));
		assertEquals(Integer.valueOf(3), b.get(1));
	}

	// the same as Copy
	public void testMove() throws Exception {
		ModifyingSequence.copy(a, b);
		assertEquals(a, b);
	}

	// the same as Copy_backward
	public void testMove_backward() throws Exception {
		b.add(2);
		b.add(1);
		ModifyingSequence.copy_backward(a, b);
		assertEquals(Integer.valueOf(2), b.get(0));
		assertEquals(Integer.valueOf(3), b.get(1));
	}

	public void testFill() throws Exception {
		ModifyingSequence.fill(a, 3);
		assertEquals(a.get(0), Integer.valueOf(3));
	}

	public void testFill_n() throws Exception {
		ModifyingSequence.fill_n(a, 2, 2);
		assertEquals(Integer.valueOf(2), a.get(0));
		assertEquals(Integer.valueOf(3), a.get(2));
	}

	public void testTransform() throws Exception {
		ModifyingSequence.transform(a, b, new Nullify());
		assertEquals(3, b.size());
		assertEquals(null, b.get(0));
	}

	public void testGenerate() throws Exception {
		ModifyingSequence.generate(a, new Repeater(1));
		assertEquals(Integer.valueOf(1), a.get(1));
	}

	public void testGenerate_n() throws Exception {
		ModifyingSequence.generate_n(a, 2, new Repeater(1));
		assertEquals(Integer.valueOf(1), a.get(1));
		assertEquals(Integer.valueOf(3), a.get(2));
	}

	public void testRemove() throws Exception {
		ModifyingSequence.remove(a, 3);
		assertEquals(2, a.size());
	}

	public void testRemoveIf() throws Exception {
		ModifyingSequence.removeIf(a, equalThree);
		assertEquals(2, a.size());
	}

	public void testRemoveCopy() throws Exception {
		ModifyingSequence.removeCopy(a, b, 3);
		assertEquals(Integer.valueOf(3), b.get(0));
	}

	public void testRemoveCopyIf() throws Exception {
		ModifyingSequence.removeCopyIf(a, b, equalThree);
		assertEquals(Integer.valueOf(3), b.get(0));
	}

	public void testReplace() throws Exception {
		ModifyingSequence.replace(a, 3, 1);
		assertEquals(Integer.valueOf(1), a.get(2));
	}

	public void testReplaceIf() throws Exception {
		ModifyingSequence.replaceIf(a, equalThree, 1);
		assertEquals(Integer.valueOf(1), a.get(2));
	}

	public void testReplaceCopy() throws Exception {
		ModifyingSequence.replaceCopy(a, b, 3, 1);
		assertEquals(Integer.valueOf(1), b.get(2));
	}

	public void testReplaceCopyIf() throws Exception {
		ModifyingSequence.replaceCopyIf(a, b, equalThree, 1);
		assertEquals(Integer.valueOf(1), b.get(2));
	}

	public void testRange_swap() throws Exception {
		b.add(3);
		ModifyingSequence.range_swap(a, b);
		assertEquals(Integer.valueOf(3), a.get(0));
		assertEquals(Integer.valueOf(1), b.get(0));
	}

	public void testReverse() throws Exception {
		ModifyingSequence.reverse(a);
		assertEquals(Integer.valueOf(1), a.get(2));
		assertEquals(Integer.valueOf(3), a.get(0));
	}

	public void testReverseCopy() throws Exception {
		ModifyingSequence.reverseCopy(a, b);
		ModifyingSequence.reverse(a);
		assertEquals(a, b);
	}

	public void testRotate() throws Exception {
		ArrayList<Integer> rotated = new ArrayList<Integer>(a);
		ModifyingSequence.rotate(a, 1);
		Collections.rotate(rotated, 1);
		assertEquals(rotated, a);
	}

	public void testRotateCopy() throws Exception {
		ArrayList<Integer> rotated = new ArrayList<Integer>(a);
		ModifyingSequence.rotateCopy(a, b, 1);
		Collections.rotate(rotated, 1);
		Collections.sort(a);
		assertEquals(rotated, b);
	}

	public void testShuffle() throws Exception {
		ModifyingSequence.shuffle(a);
		assert a.contains(1);
		assert a.contains(2);
		assert a.contains(3);
		assertEquals(3, a.size());
	}

	public void testUnique() throws Exception {
		a.add(3);
		ModifyingSequence.unique(a);
		assertEquals(3, a.size());
		assertEquals(Integer.valueOf(3), a.get(2));
	}

	public void testUniqueCopy() throws Exception {
		ArrayList<Integer> uniqued = new ArrayList<Integer>(a);
		a.add(3);
		ModifyingSequence.uniqueCopy(a, b);
		assertEquals(uniqued, b);
	}
}