package algorithms;

import functionObjects.Generator;
import functionObjects.UnaryOp;
import functionObjects.UnaryPredicate;

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

	public static <T> void copy_n(Collection<T> a, int count, Collection b) {
		for (T o : a) {
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

	public static <T> void removeCopy(Collection<T> a, Collection<T> b, T
			match) {
		Iterator<T> i = a.iterator();
		while (i.hasNext()) {
			T tmp = i.next();
			if (tmp.equals(match)) {
				i.remove();
				b.add(tmp);
			}
		}
	}

	public static <T> void removeCopyIf(Collection<T> a, Collection<T> b,
	                                 UnaryPredicate f) {
		Iterator<T> i = a.iterator();
		while (i.hasNext()) {
			T tmp = i.next();
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
			T tmp = a.get(i);
			if (before == null ? tmp == null : tmp.equals(before)) {
				a.set(i, after);
				replaced = true;
			}
		}
		return replaced;
	}

	public static <T> boolean replaceIf(List<T> a, UnaryPredicate f, T after) {
		boolean replaced = false;
		int len = a.size();
		for (int i = 0; i < len; i++) {
			if (f.call(a.get(i))) {
				a.set(i, after);
				replaced = true;
			}
		}
		return replaced;
	}

	public static <T> boolean replaceCopy(List<T> a,  List<T> b, T before, T after) {
		boolean replaced = false;
		for (T tmp : a) {
			if (before == null ? tmp == null : tmp.equals(before)) {
				b.add(after);
				replaced = true;
			}
			else {
				b.add(tmp);
			}
		}
		return replaced;
	}

	public static <T> boolean replaceCopyIf(List<T> a, List<T> b,
	                                        UnaryPredicate f, T after) {
		boolean replaced = false;
		for (T tmp : a) {
			if (f.call(tmp)) {
				b.add(after);
				replaced = true;
			}
			else {
				b.add(tmp);
			}
		}
		return replaced;
	}

	// it is impossible to implement a generic swap function in Java
	public static <T> void range_swap(List<T> a, List<T> b) {
		int len = b.size() > a.size() ? a.size() : b.size();
		for (int i = 0; i < len; i++) {
			T tmp = a.get(i);
			a.set(i, b.get(i));
			b.set(i, tmp);
		}
	}

	public static <T> void reverse(List<T> a) {
		int size = a.size() - 1;
		int middle = (size + 1) / 2;
		for (int i = 0; i < middle; i++) {
			T tmp = a.get(i);
			a.set(i, a.get(size - i));
			a.set(size - i, tmp);
		}
	}

	public static void reverseCopy(List a, List b) {
		ListIterator i = a.listIterator(a.size());
		while (i.hasPrevious()) {
			b.add(i.previous());
		}
	}

	// Two version of rotate, one for List supports RandomAccess, one for
	// List not supports RandomAccess. See doc of java.util.Collections#rotate.
	// I only implement the second one, since it is easier than the first
	// one :)
	public static <T> void rotate(List<T> a, int distance) {
		int size = a.size();
		if (size == 0)
			return;
		int pivot = -distance % size;
		if (pivot < 0)
			pivot += size;
		if (pivot == 0)
			return;
		reverse(a.subList(0, pivot));
		reverse(a.subList(pivot, size));
		reverse(a);
	}

	public static <T> void rotateCopy(List<T> a, List<T> b, int distance) {
		b.addAll(a);
		rotate(b, distance);
	}

	public static <T> void shuffle(List<T> a) {
		int size = a.size();
		Random rd = new Random();
		for (int i = 0; i < size; i++) {
			int randomNum = rd.nextInt(size);
			T tmp = a.get(i);
			a.set(i, a.get(randomNum));
			a.set(randomNum, tmp);
		}
	}

	public static <T> void unique(Collection<T> a) {
		Iterator<T> i = a.iterator();
		if (!i.hasNext()) {
			return;
		}
		T head = i.next();
		while (i.hasNext()) {
			T cur = i.next();
			if (head.equals(cur)) {
				i.remove();
			}
			else {
				head = cur;
			}
		}
	}

	public static <T> void uniqueCopy(Collection<T> a, Collection<T> b) {
		Iterator<T> i = a.iterator();
		if (!i.hasNext()) {
			return;
		}
		T head = i.next();
		b.add(head);
		while (i.hasNext()) {
			T cur = i.next();
			if (!head.equals(cur)) {
				b.add(cur);
				head = cur;
			}
		}
	}
}