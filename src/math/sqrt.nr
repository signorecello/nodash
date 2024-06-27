// TODO: check if this is correct
pub fn sqrt(value: U128) -> U128 {
    let r = sqrt_unconstrained(value);
    assert(value >= r * r);
    let r_plus_1 = r + U128::from_integer(1);
    assert(value < r_plus_1 * r_plus_1);
    r
}

unconstrained fn sqrt_unconstrained(value: U128) -> U128 {
    if value > U128::from_integer(3) {
        let ONE = U128::from_integer(1);
        let TWO = U128::from_integer(2);
        let mut z = value;
        let mut x = value / TWO + ONE;
        for _ in 0..999999999 {
            if x < z {
                z = x;
                x = (value / x + x) / TWO;
            } else {
                break;
            }
        }
        z
    } else if value > U128::from_integer(0) {
        U128::from_integer(1)
    } else {
        U128::from_integer(0)
    }
}

mod sqrt_tests {
    use crate::math::sqrt::sqrt;

    #[test]
    fn test_sqrt() {
        let value = U128::from_integer(170141183460469231731687303715884105727);
        let result = sqrt(value);
        assert(result == U128::from_integer(13043817825332782212));
    }

    #[test]
    fn test_sqrt_many_numbers() {
        let pairs: [[Field; 2]] = &[
            [0, 0],
            [1, 1],
            [2, 1],
            [3, 1],
            [4, 2],
            [5, 2],
            [6, 2],
            [7, 2],
            [8, 2],
            [9, 3],
            [10, 3],
            [11, 3],
            [12, 3],
            [13, 3],
            [14, 3],
            [15, 3],
            [16, 4],
            [17, 4],
            [18, 4],
            [19, 4],
            [20, 4],
            [21, 4],
            [22, 4],
            [23, 4],
            [24, 4],
            [25, 5],
            [26, 5],
            [27, 5],
            [28, 5],
            [29, 5],
            [30, 5],
            [31, 5],
            [32, 5],
            [33, 5],
            [34, 5],
            [35, 5],
            [36, 6],
            [37, 6],
            [38, 6],
            [39, 6],
            [40, 6],
            [41, 6],
            [42, 6],
            [43, 6],
            [44, 6],
            [45, 6],
            [46, 6],
            [47, 6],
            [48, 6],
            [49, 7],
            [50, 7],
            [51, 7],
            [52, 7],
            [53, 7],
            [54, 7],
            [55, 7],
            [56, 7],
            [57, 7],
            [58, 7],
            [59, 7],
            [60, 7],
            [61, 7],
            [62, 7],
            [63, 7],
            [64, 8],
            [65, 8],
            [66, 8],
            [67, 8],
            [68, 8],
            [69, 8],
            [70, 8],
            [71, 8],
            // some big numbers
            [9000000000000000000, 3000000000],
            [8274823429819348192323, 90966056470]
        ];

        for pair in pairs {
            let value = U128::from_integer(pair[0]);
            let result = sqrt(value);
            // dep::std::println(f"{pair} {result}");
            assert(result == U128::from_integer(pair[1]));
        }
    }
}
