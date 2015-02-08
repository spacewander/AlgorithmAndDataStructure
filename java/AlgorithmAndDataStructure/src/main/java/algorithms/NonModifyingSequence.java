package algorithms;

import functionObjects.BinaryPredicate;
import functionObjects.UnaryOp;
import functionObjects.UnaryPredicate;

import java.util.AbstractMap;
import java.util.Collection;
import java.util.Iterator;

/**
 * Please ignore some Warnings...
 */
public class NonModifyingSequence {
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

	@SuppressWarnings("unchecked")
	public static <T extends Object> T find(Collection c, T match) {
		for (Object o : c) {
			if (o.equals(match))
				return (T)o;
		}
		return null;
	}

	@SuppressWarnings("unchecked")
	public static <T extends Object> T findIf(Collection c, UnaryPredicate f) {
		for (Object o : c) {
			if (f.call(o))
				return (T)o;
		}
		return null;
	}

	@SuppressWarnings("unchecked")
	public static <T extends Object> T findIfNot(Collection c, UnaryPredicate f) {
		for (Object o : c) {
			if (!f.call(o))
				return (T)o;
		}
		return null;
	}

	public static Iterator findFirstOf(Collection a, Collection b, BinaryPredicate f) {
		for (Iterator i = a.iterator(); i.hasNext();) {
			Object o = i.next();
			for (Object j : b) {
				if (f.call(o, j))
					return i;
			}
		}
		return null;
	}

	public static Iterator findEnd(Collection a, Collection b, BinaryPredicate f) {
		for (Iterator i = a.iterator(); i.hasNext();) {
			for (Object j : b) {
				if (f.call(i.next(), j))
					return i;
			}
		}
		return null;
	}

	public static Iterator adjacent_find(Collection c, BinaryPredicate f) {
		if (c.size() < 2)
			return null;
		Iterator i = c.iterator();
		Object prev = i.next();
		while (i.hasNext()) {
			Object cur = i.next();
			if (f.call(prev, cur))
				return i;
			prev = cur;
		}
		return null;
	}
}
