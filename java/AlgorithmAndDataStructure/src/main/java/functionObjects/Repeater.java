package functionObjects;

/**
 * Created by lzx on 15-2-16.
 */
public class Repeater implements Generator {
	private Object repeatedValue;

	public Repeater(Object value) {
		repeatedValue = value;
	}

	@Override
	public Object call() {
		return repeatedValue;
	}
}
