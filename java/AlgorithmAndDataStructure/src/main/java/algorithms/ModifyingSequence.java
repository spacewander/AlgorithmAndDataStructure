package algorithms;

import functionObjects.Generator;
import functionObjects.UnaryOp;
import functionObjects.UnaryPredicate;

import javax.swing.text.html.HTMLDocument;
import java.util.*;

/**
 * Created by lzx on 15-2-16.
 */
public class ModifyingSequence {
	public static void copy(Collection a, Collection b) {
		b.addAll(a);
	}

	public static void copy_if(Collection a, Collection b, UnaryPredicate f) {
		for (Object o : a) {
			if (f.call(o))
				b.add(o);
		}
	}

	public static void copy_n(Collection a, int count, Collection b) {
		for (Object o : a) {
			if (count == 0)
				break;
			b.add(o);
			count--;
		}
	}

	public static void copy_backward(List a, List b) {
		int idxB = b.size() - 1;
		ListIterator iterA = a.listIterator(a.size());
		while (iterA.hasPrevious() && idxB >= 0) {
			b.set(idxB, iterA.previous());
			idxB--;
		}
	}

	public static void move(Collection a, Collection b) {
		copy(a, b);
	}

	public static void move_backward(List a, List b) {
		copy_backward(a, b);
	}

	public static <T> void fill(List<T> a, T value) {
		int len = a.size();
		for (int i = 0; i < len; i++) {
			a.set(i, value);
		}
	}

	public static <T> void fill_n(List<T> a, int count, T value) {
		for (int i = 0; i < count; i++) {
			a.set(i, value);
		}
	}

	public static void transform(Collection a, Collection b, UnaryOp f) {
		for (Object o : a) {
			b.add(f.call(o));
		}
	}

	public static void generate(List a, Generator g) {
		int len = a.size();
		for (int i = 0; i < len; i++) {
			a.set(i, g.call());
		}
	}

	public static void generate_n(List a, int count, Generator g) {
		for (int i = 0; i < count; i++) {
			a.set(i, g.call());
		}
	}

	public static boolean remove(Collection a, Object match) {
		boolean removed = false;
		Iterator i = a.iterator();
		while (i.hasNext()) {
			if (i.next().equals(match)) {
				i.remove();
				removed = true;
			}
		}
		return removed;
	}

	public static boolean removeIf(Collection a, UnaryPredicate f) {
		boolean removed = false;
		Iterator i = a.iterator();
		while (i.hasNext()) {
			if (f.call(i.next())) {
				i.remove();
				removed = true;
			}
		}
		return removed;
	}

	public static void removeCopy(Collection a, Collection b, Object match) {
		Iterator i = a.iterator();
		while (i.hasNext()) {
			Object tmp = i.next();
			if (tmp.equals(match)) {
				i.remove();
				b.add(tmp);
			}
		}
	}

	public static void removeCopyIf(Collection a, Collection b, UnaryPredicate f) {
		Iterator i = a.iterator();
		while (i.hasNext()) {
			Object tmp = i.next();
			if (f.call(tmp)) {
				i.remove();
				b.add(tmp);
			}
		}
	}

	public static <T> boolean replace(List<T> a,  T before, T after) {
		boolean replaced = false;
		int len = a.size();
		for (int i = 0; i < len; i++) {
			Object tmp = a.get(i);
			if (before == null ? tmp == null : tmp.equals(before)) {
				a.set(i, after);
				replaced = true;
			}
		}
		return replaced;
	}
}