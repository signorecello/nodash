mod sqrt;

pub fn clamp<T>(x: T, min: T, max: T) -> T where T: Ord {
    if (x < min) {
        min
    } else if (x > max) {
        max
    } else {
        x
    }
}

mod clamp_tests {
    use crate::math::clamp;

    #[test]
    fn test_clamp() {
        // if too small, return min
        assert(clamp(1 as u64, 2 as u64, 3 as u64) == 2 as u64);
        // if too big, return max
        assert(clamp(4 as u64, 1 as u64, 3 as u64) == 3 as u64);
        // if in range, return value
        assert(clamp(2 as u64, 1 as u64, 3 as u64) == 2 as u64);
    }
}
