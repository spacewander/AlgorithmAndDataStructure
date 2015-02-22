package functionObjects;

/**
 * Created by lzx on 15-2-22.
 */
public class PlusOne implements Itoa<Integer> {
	private Integer cur;
	public PlusOne(Integer i) {
		cur = i;
	}

	@Override
	public void increase() {
		cur++;
	}

	@Override
	public Integer value() {
		return cur;
	}
}
