package functionObjects;

/**
 * Created by lzx on 15-2-22.
 */
public class XPlusY implements BinaryOp<Integer> {
	@Override
	public Integer call(Integer x, Integer y) {
		return x + y;
	}
}
