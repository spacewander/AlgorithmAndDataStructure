package functionObjects;

/**
 * Created by lzx on 15-2-7.
 */
public class Equals implements  BinaryPredicate {
	@Override
	public boolean call(Object a, Object b) {
		return a.equals(b);
	}
}
