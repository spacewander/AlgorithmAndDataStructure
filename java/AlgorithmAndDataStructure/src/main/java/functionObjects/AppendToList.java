package functionObjects;

import java.util.ArrayList;

/**
 * Created by lzx on 15-2-7.
 */
public class AppendToList implements UnaryOp {
	private ArrayList ary = new ArrayList();

	public ArrayList getAry() {
		return ary;
	}

	public void call(Object o) {
		ary.add(o);
	}
}
