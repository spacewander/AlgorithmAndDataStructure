package functionObjects;

/**
 * Created by lzx on 15-2-22.
 */
public interface BinaryOp<T> {
	T call(T x, T y);
}
