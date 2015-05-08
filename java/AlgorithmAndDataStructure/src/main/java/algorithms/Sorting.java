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
		quicksort(a, 0, a.size() - 1);
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

	public static <T extends Comparable> void partialSort(List<T> a, int
			border) {
		ArrayList<T> tmp = new ArrayList<T>();
		Heap.makeHeap(a);
		int bound = a.size();
		for (int i = 0; i < border && i < bound; i++) {
			tmp.add(Heap.popHeap(a));
		}
		int size = tmp.size();
		for (int i = size - 1; i >= 0; i--) {
			a.add(0, tmp.get(i));
		}
	}

	public static <T extends Comparable> void partialSortCopy(List<T> a, int
			border, List<T> b) {
		ArrayList<T> tmp = new ArrayList<T>(a);
		Heap.makeHeap(tmp);
		int bound = a.size();
		for (int i = 0; i < border && i < bound; i++) {
			b.add(Heap.popHeap(tmp));
		}
	}

	// Heap.make_heap will construct a min-heap, so we use it to
	// find the nlargest element, which n is one-base.
	// assume 0 < n < a.size()
	public static <T extends Comparable> T nthElement(List<T> a, int n) {
		ArrayList<T> tmp = new ArrayList<T>(a);
		Heap.makeHeap(tmp);
		int size = tmp.size();
		for (int i = n; i < size; i++) {
			if (a.get(i).compareTo(tmp.get(0)) > 0) {
				Heap.popHeap(tmp);
				Heap.pushHeap(tmp, a.get(i));
			}
		}
		return Heap.popHeap(tmp);
	}

	public static <T> void stableSort(List<T> a, Comparator<T> cp) {
		int size = a.size();
		if (size <= 1)
			return;
		ArrayList<Integer> pos = new ArrayList<Integer>(size);
		for (int i = 0; i < size; i++) {
			pos.add(i);
		}
		stableQuicksort(a, 0, size - 1, cp, pos);

		int from = 0;
		for (int to = 1; to < size; to++) {
			if (cp.compare(a.get(from), a.get(to)) != 0) {
				if (to - from > 1) {
					Collections.sort(a.subList(from, to), cp);
				}
				from = to;
			}
		}
	}

	private static <T> void stableQuicksort(List<T> a, int
			start, int end, Comparator<T> cp, ArrayList<Integer> pos) {
		if (start < end) {
			int pivot = stablePartition(a, start, end, cp, pos);
			stableQuicksort(a, start, pivot - 1, cp, pos);
			stableQuicksort(a, pivot + 1, end, cp, pos);
		}
	}

	private static <T> int stablePartition(List<T> a, int
			start, int end, Comparator<T> cp, ArrayList<Integer> pos) {
		T x = a.get(end);
		int i = start - 1;
		for (int j = start; j < end; j++) {
			if (cp.compare(a.get(j), x) <= 0) {
				i += 1;
				swap(a, i, j);
				swap(pos, i, j);
			}
		}
		swap(a, i + 1, end);
		swap(pos, i + 1, end);
		return i + 1;
	}
}
