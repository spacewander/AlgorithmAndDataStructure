package algorithms;

import functionObjects.EqualX;
import functionObjects.AppendToList;
import functionObjects.Equals;
import junit.framework.Test;
import junit.framework.TestCase;
import junit.framework.TestSuite;

import java.util.AbstractMap;
import java.util.ArrayList;
import java.util.Iterator;

/**
 * Unit test for simple NonModifyingSequence.
 */
public class NonModifyingSequenceTest
    extends TestCase
{
	private ArrayList<Integer> a;
	private EqualX equalThree;
	private Equals equals;

    /**
     * Create the test case
     *
     * @param testName name of the test case
     */
    public NonModifyingSequenceTest(String testName)
    {
        super( testName );
    }

    /**
     * @return the suite of tests being tested
     */
    public static Test suite()
    {
        return new TestSuite( NonModifyingSequenceTest.class );
    }

	public void setUp() {
		a = new ArrayList<Integer>();
		equalThree = new EqualX(3);
		equals = new Equals();
	}

    /**
     * Rigours Test :-)
     */
    public void testApp()
    {
        assertTrue( true );
    }

	public void testAnyOf() throws Exception {
		a.add(1);
		a.add(2);
		a.add(3);
		assertTrue(NonModifyingSequence.anyOf(a, equalThree));
		a.remove(Integer.valueOf(3));
		assertFalse(NonModifyingSequence.anyOf(a, equalThree));
	}

	public void testAllOf() throws Exception {
		a.add(3);
		a.add(3);
		assertTrue(NonModifyingSequence.allOf(a, equalThree));
		a.set(1, 2);
		assertFalse(NonModifyingSequence.allOf(a, equalThree));
	}

	public void testNoneOf() throws Exception {
		a.add(2);
		assertTrue(NonModifyingSequence.noneOf(a, equalThree));
		a.add(3);
		assertFalse(NonModifyingSequence.noneOf(a, equalThree));
	}

	public void testForEach() throws Exception {
		ArrayList<Integer> ary = new ArrayList<Integer>();
		ary.add(1);
		ary.add(2);
		AppendToList aToL = new AppendToList();
		NonModifyingSequence.forEach(ary, aToL);
		assertEquals(ary, aToL.getAry());
	}

	public void testCount_if() throws Exception {
		a.add(2);
		a.add(3);
		assertEquals(1, NonModifyingSequence.count_if(a, equalThree));
	}

	public void testCount() throws Exception {
		a.add(2);
		a.add(3);
		assertEquals(1, NonModifyingSequence.count(a, 3));
	}

	public void testMismatch() throws Exception {
		ArrayList<Integer> ary = new ArrayList<Integer>();
		ary.add(1);
		ary.add(2);
		a.add(2);
		a.add(3);
		AbstractMap.SimpleImmutableEntry entry = NonModifyingSequence.mismatch(a, ary, equals);
		assertEquals(3, ((Iterator)(entry.getKey())).next());
		assertEquals(2, ((Iterator)(entry.getValue())).next());
	}

	public void testEqual() throws Exception {
		ArrayList<Integer> ary = new ArrayList<Integer>();
		ary.add(1);
		a.add(1);
		assertTrue(NonModifyingSequence.equal(ary, a, equals));
		a.remove(Integer.valueOf(1));
		assertFalse(NonModifyingSequence.equal(ary, a, equals));
	}
}
