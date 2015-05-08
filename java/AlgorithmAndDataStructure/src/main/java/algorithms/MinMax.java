package algorithms;

import java.util.*;

/**
 * Created by lzx on 15-2-20.
 */
public class MinMax {
	public static <T extends Comparable> T max(T a, T b) {
		return a.compareTo(b) > 0 ? a : b;
	}

	public static <T extends Comparable> T min(T a, T b) {
		return a.compareTo(b) < 0 ? a : b;
	}

	public static <T extends Comparable> Pair<T, T> minmax(T a, T b) {
		return a.compareTo(b) < 0 ? new Pair<T, T>(a, b) : new Pair<T, T>(b, a);
	}

	public static <T extends Comparable> T maxElement(Collection<T> c) {
		Iterator<T> i = c.iterator();
		if (!i.hasNext())
			return null; // empty collection
		T max = i.next();
		while (i.hasNext()) {
			T cur = i.next();
			if (cur.compareTo(max) > 0)
				max = cur;
		}
		return max;
	}

	public static <T extends Comparable> T minElement(Collection<T> c) {
		Iterator<T> i = c.iterator();
		if (!i.hasNext())
			return null; // empty collection
		T min = i.next();
		while (i.hasNext()) {
			T cur = i.next();
			if (cur.compareTo(min) < 0)
				min = cur;
		}
		return min;
	}

	public static <T extends Comparable> Pair<T, T> minmaxElement
			(Collection<T> c) {
		Iterator<T> i = c.iterator();
		if (!i.hasNext())
			return null; // empty collection
		T min = i.next();
		T max = min;
		while (i.hasNext()) {
			T cur = i.next();
			if (cur.compareTo(min) < 0)
				min = cur;
			else if (cur.compareTo(max) > 0)
				max = cur;
		}
		return new Pair(min, max);
	}

    // return true if a is lexicographically not less than b
	public static boolean lexicographicalCompare(String a, String b) {
		char[] ch1 = a.toCharArray();
		char[] ch2 = b.toCharArray();
		if (ch2.length != ch1.length)
			return a <= b;
		int len = ch1.length;
		for (int i = 0; i < len; i++) {
			if (ch1[i] < ch2[i]) {
			    return true;
			}
			else if (ch2[i] < ch1[i]) {
				return false;
			}
		}
		return true;
	}

	public static <T> boolean isPermutation(List<T> a, List<T> b) {
		if (a.size() != b.size())
			return false;
		Map<T, Integer> elements = new TreeMap<T, Integer>();
		for (T e : a) {
			if (elements.containsKey(e)) {
			    elements.put(e, elements.get(e) + 1);
			}
			else {
				elements.put(e, 1);
			}
		}
		for (T e : b) {
			if (elements.containsKey(e) && elements.get(e).compareTo(0) > 0) {
			    elements.put(e, elements.get(e) - 1);
			}
			else {
				return false;
			}
		}
		return true;
	}

	private static <T> void swap(List<T> list, int a, int b) {
		T tmp = list.get(a);
		list.set(a, list.get(b));
		list.set(b, tmp);
	}

	// Return a boolean variable to indicate if the next permutation exists.
	public static <T extends Comparable> boolean nextPermutation(List<T> a) {
		int size = a.size();
		if (size <= 1)
			return false;
		int i = size - 1;
		while (true) {
			int pos1 = i;
			i--;
			if (a.get(i).compareTo(a.get(pos1)) < 0) {
				int pos2 = size - 1;
				while (a.get(i).compareTo(a.get(pos2)) >= 0)
					pos2--;
				swap(a, i, pos2);
				int pivot = (size - pos1) / 2;
				for (int j = 0; j < pivot; j++) {
					swap(a, pos1 + j, size - j - 1);
				}
				return true;
			}
			if (i == 0) {
				Collections.reverse(a);
				return false;
			}
		}
	}

	public static <T extends Comparable> boolean prevPermutation(List<T> a) {
		int size = a.size();
		if (size <= 1)
			return false;
		int i = size - 1;
		while (true) {
			int pos1 = i;
			i--;
			if (a.get(pos1).compareTo(a.get(i)) < 0) {
				int pos2 = size - 1;
				while (a.get(pos2).compareTo(a.get(i)) >= 0)
					pos2--;
				swap(a, i, pos2);
				int pivot = (size - pos1) / 2;
				for (int j = 0; j < pivot; j++) {
					swap(a, pos1 + j, size - j - 1);
				}
				return true;
			}
			if (i == 0) {
				Collections.reverse(a);
				return false;
			}
		}
	}
}
