package algorithms;

import functionObjects.UnaryPredicate;

import java.util.Collection;
import java.util.Iterator;
import java.util.List;

/**
 * Created by lzx on 15-2-17.
 */
public class Partitioning {
	private static void swap(List list, int a, int b) {
		Object tmp = list.get(a);
		list.set(a, list.get(b));
		list.set(b, tmp);
	}

	public static boolean isPartitioned(Collection a, UnaryPredicate f) {
		Iterator i = a.iterator();
		while (i.hasNext()) {
			if (!f.call(i.next()))
				break;
		}
		while (i.hasNext()) {
			if (f.call(i.next()))
				return false;
		}
		return true;
	}

	public static void partition(List a, UnaryPredicate f) {
		int end = a.size();
		int start = 0;
		while (start != end && f.call(a.get(start)))
			++start;
		for (int pioneer = start; pioneer < end; pioneer++) {
			if (f.call(a.get(pioneer))) {
				swap(a, pioneer, start);
				++start;
			}
		}
	}

	public static void partitionCopy(Collection a, Collection outTrue,
	                                 Collection outFalse, UnaryPredicate f) {
		for (Object o : a) {
			if (f.call(o)) {
			    outTrue.add(o);
			}
			else {
				outFalse.add(o);
			}
		}
	}

	public static void stablePartition(List a, UnaryPredicate f) {
		int start = 0;
		int end = a.size();
		while (start != end && f.call(a.get(start)))
			++start;
		for (int pioneer = start; pioneer < end; pioneer++) {
			if (f.call(a.get(pioneer))) {
				swap(a, pioneer, start);
				int follower = pioneer;
				while (follower != start) {
					swap(a, follower, follower - 1);
					--follower;
				}
			}
		}
	}

	public static int partitionPoint(List a, UnaryPredicate f) {
		int start = 0;
		int end = a.size();
		while (start != end) {
			if (!f.call(a.get(start))) {
				return start + 1;
			}
			++start;
		}
		return start;
	}
}
