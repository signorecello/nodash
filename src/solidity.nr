use dep::std;

pub fn encode_with_selector<N, M>(selector: u32, args: [Field; N], mut result: [u8; M]) -> [u8; M] {
    // TODO: remove this assert
    assert(M == 4 + N * 32, "Invalid result length");

    // TODO: can this be optimized? Bitshifting is expensive, isn't it?
    result[0] = (selector >> 24) as u8;
    result[1] = (selector >> 16) as u8;
    result[2] = (selector >> 8) as u8;
    result[3] = selector as u8;

    for i in 0..N {
        let bytes = args[i].to_be_bytes(32);
        for j in 0..32 {
            result[4 + i * 32 + j] = bytes[j];
        }
    }

    result
}

mod tests {
    use crate::solidity::encode_with_selector;

    #[test]
    fn test_simple() {
        let result = encode_with_selector(0xbd87d14b, [1, 2], [0; 68]);
        let expected= [
            189, 135, 209, 75, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2
        ];
        assert(result == expected);
    }

    #[test]
    fn test_deposit() {
        let result = encode_with_selector(
            // FunctionSelector::from_signature("deposit_private(bytes32,address[2],uint256[2])"),
            0x86d09dae,
            [
            0x1a7097a0f09457b0b0496684b2ed6723a262da3a1b061b598ee92ce3376cb302,
            0x610178dA211FEF7D417bC0e6FeD39F05609AD788,
            0xB7f8BC63BbcaD18155201308C8f3540b07f84F5e,
            333,
            64
        ],
            [0; 164]
        );
        let expected = [
            134, 208, 157, 174, 26, 112, 151, 160, 240, 148, 87, 176, 176, 73, 102, 132, 178, 237, 103, 35, 162, 98, 218, 58, 27, 6, 27, 89, 142, 233, 44, 227, 55, 108, 179, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 97, 1, 120, 218, 33, 31, 239, 125, 65, 123, 192, 230, 254, 211, 159, 5, 96, 154, 215, 136, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 183, 248, 188, 99, 187, 202, 209, 129, 85, 32, 19, 8, 200, 243, 84, 11, 7, 248, 79, 94, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 77, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 64
        ];
        assert(result == expected);
    }

    #[test(should_fail_with = "Invalid result length")]
    fn test_fails_if_result_length_is_wrong() {
        let _ = encode_with_selector(0xbd87d14b, [1, 2], [0; 67]);
    }
}
