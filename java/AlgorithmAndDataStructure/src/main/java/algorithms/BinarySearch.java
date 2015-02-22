package algorithms;

import java.util.List;

/**
 * Created by lzx on 15-2-20.
 * All algorithms in BinarySearch Class require a sorted List as input
 */
public class BinarySearch {
	public static <T extends Comparable> int lowerBound(List<T> a, T value) {
		int guess = a.size();
		int start = 0;
		while (guess > 0) {
			int i = start;
			int step = guess / 2;
			i += step;
			if (a.get(i).compareTo(value) < 0) {
			    start = i + 1;
				guess -= step + 1;
			}
			else {
				guess = step;
			}
		}
		return start;
	}

	public static <T extends Comparable> int upperBound(List<T> a, T value) {
		int guess = a.size();
		int start = 0;
		while (guess > 0) {
			int i = start;
			int step = guess / 2;
			i += step;
			if (a.get(i).compareTo(value) <= 0) {
				start = i + 1;
				guess -= step + 1;
			}
			else {
				guess = step;
			}
		}
		return start;
	}

	public static <T extends Comparable> boolean binarySearch(List<T> a, T
			value) {
		int i = lowerBound(a, value);
		return i != a.size() && a.get(i).equals(value);
	}

	public static <T extends Comparable> Pair<Integer, Integer> equalRange(
			List<T> a, T value) {
		return new Pair<Integer, Integer>(lowerBound(a, value), upperBound(a,
				value));
	}
}
