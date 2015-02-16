package functionObjects;

/**
 * Created by lzx on 15-2-16.
 */
public class Nullify implements UnaryOp {
	@Override
	public Object call(Object o) {
		return null;
	}
}
