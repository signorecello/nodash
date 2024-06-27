mod sqrt;

pub fn min(x: U128, y: U128) -> U128 {
    if (x < y) { x } else { y }
}

pub fn max(x: U128, y: U128) -> U128 {
    if (x > y) { x } else { y }
}

pub fn clamp(x: U128, min: U128, max: U128) -> U128 {
    if (x < min) {
        min
    } else if (x > max) {
        max
    } else {
        x
    }
}

mod min_tests {
    use crate::math::min;

    #[test]
    fn test_min() {
        assert(min(U128::from_integer(1), U128::from_integer(2)) == U128::from_integer(1));
        assert(min(U128::from_integer(2), U128::from_integer(1)) == U128::from_integer(1));
        assert(min(U128::from_integer(1), U128::from_integer(1)) == U128::from_integer(1));
    }
}

mod max_tests {
    use crate::math::max;

    #[test]
    fn test_max() {
        assert(max(U128::from_integer(1), U128::from_integer(2)) == U128::from_integer(2));
        assert(max(U128::from_integer(2), U128::from_integer(1)) == U128::from_integer(2));
        assert(max(U128::from_integer(1), U128::from_integer(1)) == U128::from_integer(1));
    }
}

mod clamp_tests {
    use crate::math::clamp;

    #[test]
    fn test_clamp() {
        assert(
            clamp(
            U128::from_integer(1),
            U128::from_integer(2),
            U128::from_integer(3)
        )
            == U128::from_integer(2)
        );
        assert(
            clamp(
            U128::from_integer(2),
            U128::from_integer(1),
            U128::from_integer(3)
        )
            == U128::from_integer(2)
        );
        assert(
            clamp(
            U128::from_integer(1),
            U128::from_integer(1),
            U128::from_integer(3)
        )
            == U128::from_integer(1)
        );
        assert(
            clamp(
            U128::from_integer(3),
            U128::from_integer(1),
            U128::from_integer(3)
        )
            == U128::from_integer(3)
        );

        assert(
            clamp(
            U128::from_integer(4),
            U128::from_integer(1),
            U128::from_integer(3)
        )
            == U128::from_integer(3)
        );
    }
}
