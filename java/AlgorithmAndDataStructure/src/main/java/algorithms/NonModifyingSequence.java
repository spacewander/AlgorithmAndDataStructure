package algorithms;

import functionObjects.BinaryPredicate;
import functionObjects.UnaryOp;
import functionObjects.UnaryPredicate;

import java.util.AbstractMap;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;

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

	// Unlike other languages, we can't get mismatch data with this mismatch
	// method.
	public static Pair mismatch(Iterable a, Iterable b, BinaryPredicate f) {
		Iterator it1 = a.iterator();
		Iterator it2 = b.iterator();
		while (it1.hasNext() && it2.hasNext()) {
			if (!f.call(it1.next(), it2.next()))
				return new Pair(it1, it2);
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

	// iterator in Java can't be cloned, so I just implement a List version
	public static int findEnd(List a, List b, BinaryPredicate f) {
		int result = -1;
		int aSize = a.size(), bSize = b.size();
		for (int i = 0; i < aSize; i++) {
			int start = i;
			for (Object j : b) {
				if (start >= aSize || !f.call(a.get(start), j)) {
					break;
				}
				start++;
			}
			if (start - i == bSize)
				result = i;
		}
		return result;
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

	// only implement the Array version of search*, so we can get rid of iterator
	public static int search(List a, List b, BinaryPredicate f) {
		int size = a.size();
		if (b.size() == 0)
			return 0;
		for (int i = 0, j = 0; i < size; i++) {
			if (!f.call(a.get(i), b.get(j))) {
				j = 0;
			}
			else {
				j++;
			}
			if (j == b.size())
				return i;
		}
		return size;
	}

	public static int searchN(List a, int count, Object match, BinaryPredicate f) {
		int size = a.size();
		if (count <= 0)
			return 0;
		for (int i = 0, j = 0; i < size; i++) {
			if (!f.call(a.get(i), match)) {
				j = 0;
			}
			else {
				j++;
			}
			if (j == count)
				return i;
		}
		return size;
	}
}
