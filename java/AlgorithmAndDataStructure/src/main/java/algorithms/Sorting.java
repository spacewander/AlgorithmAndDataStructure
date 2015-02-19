package algorithms;

import java.util.*;

/**
 * Created by lzx on 15-2-19.
 */
public class Sorting {
	private static <T> void swap(List<T> list, int a, int b) {
		T tmp = list.get(a);
		list.set(a, list.get(b));
		list.set(b, tmp);
	}

	public static <T extends Comparable> boolean isSorted(List<T> a) {
		int size = a.size();
		if (size < 1)
			return true;
		for (int i = 1; i < size; i++) {
			if (a.get(i - 1).compareTo(a.get(i)) > 0)
				return false;
		}
		return true;
	}

	public static <T extends Comparable> ListIterator<T> isSortedUntil(List<T>
	a) {
		ListIterator<T> i = a.listIterator();
		if (!i.hasNext())
			return i;
		T prev = i.next();

		while (i.hasNext()) {
			T cur = i.next();
			if (prev.compareTo(cur) > 0) {
				i.previous();
				return i;
			}
			prev = cur;
		}
		return i;
	}

	// Quicksort
	public static <T extends Comparable> void sort(List<T> a) {
		int size = a.size();
		if (size <= 1)
			return;
		quicksort(a, 0, size - 1);
	}

	private static <T extends Comparable> void quicksort(List<T> a, int
			start, int end) {
		if (start < end) {
			int pivot = partition(a, start, end);
			quicksort(a, start, pivot - 1);
			quicksort(a, pivot + 1, end);
		}
	}

	private static <T extends Comparable> int partition(List<T> a, int start,
	                                                    int end) {
		T x = a.get(end);
		int i = start - 1;
		for (int j = start; j < end; j++) {
			if (a.get(j).compareTo(x) <= 0) {
				i += 1;
				swap(a, i, j);
			}
		}
		swap(a, i + 1, end);
		return i + 1;
	}
}
