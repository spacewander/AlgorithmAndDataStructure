package functionObjects;

/**
 * Created by lzx on 15-2-6.
 */
public class EqualX implements UnaryPredicate {
	private Integer x;

	public EqualX(Integer x) {
		this.x = x;
	}

	public boolean call(Object o) {
		return o.equals(x);
	}
}