pub fn max<T: PartialOrd>(a: T, b: T) -> T {
    if a < b {
        b
    } else {
        a
    }
}

pub fn min<T: PartialOrd>(a: T, b: T) -> T {
    if a < b {
        a
    } else {
        b
    }
}

pub fn max_element<T: PartialOrd>(iterable: impl IntoIterator<Item = T>) -> Option<T> {
    let iter = iterable.into_iter();
    iter.reduce(|a, b| if a < b { b } else { a })
}

pub fn min_element<T: PartialOrd>(iterable: impl IntoIterator<Item = T>) -> Option<T> {
    let iter = iterable.into_iter();
    iter.reduce(|a, b| if a < b { a } else { b })
}

pub fn min_max<T: PartialOrd>(a: T, b: T) -> (T, T) {
    if a < b {
        (a, b)
    } else {
        (b, a)
    }
}

pub fn min_max_element<T: PartialOrd + Clone>(
    iterable: impl IntoIterator<Item = T>,
) -> Option<(T, T)> {
    let mut iter = iterable.into_iter();
    let first = iter.next()?;
    let (mut min_val, mut max_val) = (first.clone(), first);
    for item in iter {
        if item < min_val {
            min_val = item.clone();
        }
        if item > max_val {
            max_val = item;
        }
    }
    Some((min_val, max_val))
}

pub fn lexicographical_compare<T: PartialOrd>(
    a: impl IntoIterator<Item = T>,
    b: impl IntoIterator<Item = T>,
) -> bool {
    let mut iter_a = a.into_iter();
    let mut iter_b = b.into_iter();

    loop {
        match (iter_a.next(), iter_b.next()) {
            (Some(x), Some(y)) => {
                if x < y {
                    return true;
                } else if x > y {
                    return false;
                }
            }
            (None, Some(_)) => return true,
            (Some(_), None) => return false,
            (None, None) => return false, // not <
        }
    }
}

pub fn is_permutation<T: PartialOrd + Clone>(
    a: impl IntoIterator<Item = T>,
    b: impl IntoIterator<Item = T>,
) -> bool {
    let mut vec_a: Vec<T> = a.into_iter().collect();
    let mut vec_b: Vec<T> = b.into_iter().collect();

    if vec_a.len() != vec_b.len() {
        return false;
    }

    vec_a.sort_by(|x, y| x.partial_cmp(y).unwrap());
    vec_b.sort_by(|x, y| x.partial_cmp(y).unwrap());

    vec_a == vec_b
}

pub fn next_permutation<T: PartialOrd + Clone>(data: &mut [T]) -> bool {
    let n = data.len();
    if n < 2 {
        return false;
    }

    let mut k = None;
    for i in (0..n - 1).rev() {
        if data[i] < data[i + 1] {
            k = Some(i);
            break;
        }
    }
    let k = match k {
        Some(index) => index,
        None => {
            data.reverse();
            return false;
        }
    };

    let mut l = None;
    for i in (k + 1..n).rev() {
        if data[k] < data[i] {
            l = Some(i);
            break;
        }
    }
    let l = l.unwrap();

    data.swap(k, l);

    data[k + 1..].reverse();

    true
}

pub fn prev_permutation<T: PartialOrd + Clone>(data: &mut [T]) -> bool {
    let n = data.len();
    if n < 2 {
        return false;
    }

    let mut k = None;
    for i in (0..n - 1).rev() {
        if data[i] > data[i + 1] {
            k = Some(i);
            break;
        }
    }
    let k = match k {
        Some(index) => index,
        None => {
            data.reverse();
            return false;
        }
    };

    let mut l = None;
    for i in (k + 1..n).rev() {
        if data[k] > data[i] {
            l = Some(i);
            break;
        }
    }
    let l = l.unwrap();

    data.swap(k, l);

    data[k + 1..].reverse();

    true
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_max() {
        assert_eq!(max(3, 5), 5);
        assert_eq!(max(10, -2), 10);
        assert_eq!(max(0.5, 0.3), 0.5);
        assert_eq!(max('a', 'b'), 'b');
    }

    #[test]
    fn test_min() {
        assert_eq!(min(3, 5), 3);
        assert_eq!(min(10, -2), -2);
        assert_eq!(min(0.5, 0.3), 0.3);
        assert_eq!(min('a', 'b'), 'a');
    }

    #[test]
    fn test_max_element() {
        let numbers = vec![3, 1, 4, 1, 5, 9];
        assert_eq!(max_element(numbers), Some(9));

        let empty: Vec<i32> = vec![];
        assert_eq!(max_element(empty), None);

        let chars = vec!['a', 'c', 'b'];
        assert_eq!(max_element(chars), Some('c'));
    }

    #[test]
    fn test_min_element() {
        let numbers = vec![3, 1, 4, 1, 5, 9];
        assert_eq!(min_element(numbers), Some(1));

        let empty: Vec<i32> = vec![];
        assert_eq!(min_element(empty), None);

        let chars = vec!['a', 'c', 'b'];
        assert_eq!(min_element(chars), Some('a'));
    }

    #[test]
    fn test_min_max() {
        assert_eq!(min_max(3, 5), (3, 5));
        assert_eq!(min_max(10, -2), (-2, 10));
        assert_eq!(min_max(0.5, 0.3), (0.3, 0.5));
        assert_eq!(min_max('a', 'b'), ('a', 'b'));
    }

    #[test]
    fn test_min_max_element() {
        let numbers = vec![3, 1, 4, 1, 5, 9];
        assert_eq!(min_max_element(numbers), Some((1, 9)));

        let empty: Vec<i32> = vec![];
        assert_eq!(min_max_element(empty), None);

        let chars = vec!['a', 'c', 'b'];
        assert_eq!(min_max_element(chars), Some(('a', 'c')));
    }

    #[test]
    fn test_lexicographical_compare() {
        let a = "abc";
        let b = "abd";
        assert!(lexicographical_compare(a.chars(), b.chars()));
        assert!(!lexicographical_compare(b.chars(), a.chars()));
        assert!(!lexicographical_compare(a.chars(), a.chars()));

        let x = vec![1, 2, 3];
        let y = vec![1, 2, 4];
        assert!(lexicographical_compare(x, y));

        let x = vec![1, 2, 3, 4];
        let y = vec![1, 2, 3];
        assert!(!lexicographical_compare(x, y));
    }

    #[test]
    fn test_is_permutation() {
        let a = vec![1, 2, 3];
        let b = vec![3, 2, 1];
        assert!(is_permutation(a, b));

        let c = vec![1, 2, 2];
        let d = vec![2, 1, 1];
        assert!(!is_permutation(c, d));

        let e = vec!['a', 'b', 'c'];
        let f = vec!['c', 'b', 'a'];
        assert!(is_permutation(e, f));

        let g = vec![1, 2, 3];
        let h = vec![1, 2, 3, 4];
        assert!(!is_permutation(g, h));
    }

    #[test]
    fn test_next_permutation() {
        let mut data = vec![1, 2, 3];
        assert!(next_permutation(&mut data));
        assert_eq!(data, vec![1, 3, 2]);

        assert!(next_permutation(&mut data));
        assert_eq!(data, vec![2, 1, 3]);

        assert!(next_permutation(&mut data));
        assert_eq!(data, vec![2, 3, 1]);

        assert!(next_permutation(&mut data));
        assert_eq!(data, vec![3, 1, 2]);

        assert!(next_permutation(&mut data));
        assert_eq!(data, vec![3, 2, 1]);

        assert!(!next_permutation(&mut data));
        assert_eq!(data, vec![1, 2, 3]);
    }

    #[test]
    fn test_prev_permutation() {
        let mut data = vec![3, 2, 1];
        assert!(prev_permutation(&mut data));
        assert_eq!(data, vec![3, 1, 2]);

        assert!(prev_permutation(&mut data));
        assert_eq!(data, vec![2, 3, 1]);

        assert!(prev_permutation(&mut data));
        assert_eq!(data, vec![2, 1, 3]);

        assert!(prev_permutation(&mut data));
        assert_eq!(data, vec![1, 3, 2]);

        assert!(prev_permutation(&mut data));
        assert_eq!(data, vec![1, 2, 3]);

        assert!(!prev_permutation(&mut data));
        assert_eq!(data, vec![3, 2, 1]);
    }
}
