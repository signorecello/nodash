mod math;
mod solidity;
mod string;

use string::to_hex_string_bytes;
use math::{clamp, sqrt::sqrt};

pub fn array_concat<T, let L1: u32, let L2: u32, let L: u32>(a: [T; L1], b: [T; L2]) -> [T; L] {
    assert(L1 + L2 == L, "array_concat: array lengths do not match");
    let mut result = [a[0]; L];
    for i in 0..L1 {
        result[i] = a[i];
    }
    for i in 0..L2 {
        result[i + L1] = b[i];
    }
    result
}
