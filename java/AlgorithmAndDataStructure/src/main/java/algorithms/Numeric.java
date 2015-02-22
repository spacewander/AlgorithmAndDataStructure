package algorithms;

import functionObjects.BinaryOp;
import functionObjects.Itoa;

import java.util.Collection;
import java.util.Iterator;
import java.util.List;

/**
 * Created by lzx on 15-2-22.
 */
public class Numeric {
	public static <T> void itoa(List<T> a, Itoa<T> it) {
		int size = a.size();
		for (int i = 0; i < size; i++) {
			a.set(i, it.value());
			it.increase();
		}
	}

	public static <T> T accumulate(Collection<T> a, T init, BinaryOp<T> op) {
		for (T o : a)
			init = op.call(init, o);
		return init;
	}

	public static <T> void innerProduct(Collection<T> a, Collection<T> b,
	                                    Collection<T> out, BinaryOp<T> op) {
		Iterator<T> ia = a.iterator();
		Iterator<T> ib = b.iterator();
		while (ia.hasNext() && ib.hasNext())
			out.add(op.call(ia.next(), ib.next()));
	}

	// should we rename it to adjacentOp?
	public static <T> void adjacentDifference(Collection<T> a, Collection<T> out,
	                                          BinaryOp<T> op) {
		Iterator<T> i = a.iterator();
		if (!i.hasNext())
			return;
		T prev = i.next();
		out.add(prev);
		while (i.hasNext()) {
			T cur = i.next();
			out.add(op.call(prev, cur));
			prev = cur;
		}
	}

	// call it partialReduce better
	public static <T> void partialSum(Collection<T> a, Collection<T> out,
	                                  BinaryOp<T> op) {
		Iterator<T> i = a.iterator();
		if (!i.hasNext())
			return;
		T sum = i.next();
		out.add(sum);
		while (i.hasNext()) {
			sum = op.call(sum, i.next());
			out.add(sum);
		}
	}
}
