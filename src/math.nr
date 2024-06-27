mod sqrt;

pub fn min(x: U128, y: U128) -> U128 {
    if (x < y) { x } else { y }
}

pub fn max(x: U128, y: U128) -> U128 {
    if (x > y) { x } else { y }
}

mod min_tests {
    use crate::math::min;

    #[test]
    fn test_min() {
        assert(min(U128::from_integer(0), U128::from_integer(1)) == U128::from_integer(0));
        assert(min(U128::from_integer(1), U128::from_integer(0)) == U128::from_integer(0));
        assert(min(U128::from_integer(0), U128::from_integer(0)) == U128::from_integer(0));
    }
}

mod max_tests {
    use crate::math::max;

    #[test]
    fn test_max() {
        assert(max(U128::from_integer(0), U128::from_integer(1)) == U128::from_integer(1));
        assert(max(U128::from_integer(1), U128::from_integer(0)) == U128::from_integer(1));
        assert(max(U128::from_integer(0), U128::from_integer(0)) == U128::from_integer(0));
    }
}
