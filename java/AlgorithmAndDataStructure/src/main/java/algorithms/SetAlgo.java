package algorithms;

import java.util.ArrayList;
import java.util.List;
import java.util.TreeSet;

/**
 * Created by lzx on 15-2-20.
 */
public class SetAlgo {
	public static <T> List<T> merge(List<T> a, List<T> b) {
		TreeSet<T> set = new TreeSet<T>(a);
		set.addAll(b);
		return new ArrayList<T>(set);
	}

	public static <T extends Comparable> void inplaceMerge(List<T> a, List<T>
			b) {
		int j = 0;
		int aSize = a.size();
		int bSize = b.size();
		for (int i = 0; i < aSize; i++) {
			while (a.get(i).compareTo(b.get(j)) >= 0 && j < bSize) {
				if (a.get(i).compareTo(b.get(j)) > 0)
					a.add(i, b.get(j));
				j++;
			}
		}
		while (j < bSize) {
			a.add(b.get(j));
			j++;
		}
	}

	// just like containsAll
	public static <T> boolean includes(List<T> outer, List<T> inner) {
		for (T t : inner) {
			if (!outer.contains(t))
				return false;
		}
		return true;
	}

	// act the same as merge
	public static <T> List<T> union(List<T> a, List<T> b) {
		TreeSet<T> set = new TreeSet<T>(a);
		set.addAll(b);
		return new ArrayList<T>(set);
	}

	public static <T> List<T> difference(List<T> a, List<T> b) {
		TreeSet<T> set = new TreeSet<T>(a);
		set.removeAll(b);
		return new ArrayList<T>(set);
	}

	public static <T> List<T> intersection(List<T> a, List<T> b) {
		return difference(union(a, b), union(difference(a, b), difference(b,
				a)));
	}

	public static <T> List<T> symmetricDifference(List<T> a, List<T> b) {
		return union(difference(a, b), difference(b, a));
	}
}
