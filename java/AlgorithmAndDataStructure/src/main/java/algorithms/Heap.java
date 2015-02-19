package algorithms;

import org.omg.CORBA.CODESET_INCOMPATIBLE;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

/**
 * Created by lzx on 15-2-19.
 */
public class Heap {
	public static <T extends Comparable> boolean isHeap(List<T> a) {
		int size = a.size();
		if (size < 1)
			return true;
		for (int i = 1; i < size; i++) {
			if (a.get(i).compareTo(a.get((i - 1) / 2)) < 0)
				return false;
		}
		return true;
	}

	// return index instead of an iterator
	public static <T extends Comparable> int isHeapUntil(List<T> a) {
		int size = a.size();
		if (size < 1)
			return 0;
		for (int i = 1; i < size; i++) {
			if (a.get(i).compareTo(a.get((i - 1) / 2)) < 0)
				return i;
		}
		return size;
	}

	// this is a min heap
	public static <T extends Comparable> void makeHeap(List<T> a) {
		int size = a.size();
		for (int i = size / 2 - 1; i > -1; i--) {
			while (true) {
				int left = 2 * i + 1;
				if (left >= size)
					break;
				int smallest = a.get(left).compareTo(a.get(i)) < 0 ? left : i;
				int right = left + 1;
				if (right < size)
					smallest = a.get(right).compareTo(a.get(smallest)) < 0 ?
							right : smallest;
				if (a.get(smallest) != a.get(i)) {
					T tmp = a.get(smallest);
					a.set(smallest, a.get(i));
					a.set(i, tmp);
					i = smallest;
				}
				else {
					break;
				}
			}
		}
	}

	public static <T extends Comparable> T popHeap(List<T> a) {
		T tmp = a.get(0);
		a.remove(0);
		makeHeap(a);
		return tmp;
	}

	public static <T extends Comparable> void pushHeap(List<T> a, T val) {
		a.add(val);
		makeHeap(a);
	}

	// use a temp collection to hold elements popped from a
	public static <T extends Comparable> void sortHeap(List<T> a) {
		int size = a.size();
		makeHeap(a);
		ArrayList res = new ArrayList();
		for (int i = 0; i < size; i++) {
			res.add(popHeap(a));
		}
		a.addAll(res);
	}
}
