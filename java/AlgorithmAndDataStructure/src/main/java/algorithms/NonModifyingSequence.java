package algorithms;

import functionObjects.BinaryPredicate;
import functionObjects.UnaryOp;
import functionObjects.UnaryPredicate;

import java.util.AbstractMap;
import java.util.Collection;
import java.util.Iterator;

/**
 * Hello world!
 *
 */
public class NonModifyingSequence {
    public static void main( String[] args )
    {
        System.out.println( "Hello World!" );
    }

	public static boolean anyOf(Collection c, UnaryPredicate f) {
		for (Object o : c) {
			if (f.call(o))
				return true;
		}
		return false;
	}

	public static boolean allOf(Collection c, UnaryPredicate f) {
		for (Object o : c) {
			if (!f.call(o))
				return false;
		}
		return true;
	}

	public static boolean noneOf(Collection c, UnaryPredicate f) {
		for (Object o : c) {
			if (f.call(o))
				return false;
		}
		return true;
	}

	public static void forEach(Collection c, UnaryOp f) {
		for (Object o : c)
			f.call(o);
	}

	public static int count_if(Collection c, UnaryPredicate f) {
		int num = 0;
		for (Object o : c) {
			if (f.call(o))
				num++;
		}
		return num;
	}

	public static int count(Collection c, Object match) {
		int num = 0;
		for (Object o : c) {
			if (o.equals(match))
				num++;
		}
		return num;
	}

	// unlike other languages, we can't get mismatch data with this mismatch method
	public static AbstractMap.SimpleImmutableEntry mismatch(Iterable a, Iterable b, BinaryPredicate f) {
		Iterator it1 = a.iterator();
		Iterator it2 = b.iterator();
		while (it1.hasNext() && it2.hasNext()) {
			if (!f.call(it1.next(), it2.next()))
				return new AbstractMap.SimpleImmutableEntry(it1, it2);
		}
		return null;
	}

	public static boolean equal(Iterable a, Iterable b, BinaryPredicate f) {
		Iterator it1 = a.iterator();
		Iterator it2 = b.iterator();
		while (it1.hasNext() && it2.hasNext()) {
			if (!f.call(it1.next(), it2.next()))
				return false;
		}
		if (it1.hasNext() || it2.hasNext())
			return false;
		return true;
	}
}
