mod math;
mod solidity;
mod string;

pub use string::to_hex_string_bytes;
pub use math::{clamp, sqrt::sqrt};

pub fn array_concat<T, let L1: u32, let L2: u32>(a: [T; L1], b: [T; L2]) -> [T; L1 + L2] {
    let mut result = [a[0]; L1 + L2];
    for i in 0..L1 {
        result[i] = a[i];
    }
    for i in 0..L2 {
        result[i + L1] = b[i];
    }
    result
}

mod array_concat_tests {
    use crate::array_concat;

    #[test]
    fn test_simple() {
        let a: [u8; 3] = [1, 2, 3];
        let b: [u8; 2] = [4, 5];
        let c: [u8; 5] = array_concat(a, b);
        assert(c == [1, 2, 3, 4, 5]);
    }
}
