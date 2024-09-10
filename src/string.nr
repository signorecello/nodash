global ASCII_HEX_TABLE: [u8; 16] = "0123456789abcdef".as_bytes();

pub fn to_hex_string_bytes(value: Field) -> [u8; 64] {
    let mut result = [0 as u8; 64];
    let bytes: [u8; 32] = value.to_be_bytes(32).as_array();
    for i in 0..bytes.len() {
        result[i * 2] = ASCII_HEX_TABLE[bytes[i] / 16];
        result[i * 2 + 1] = ASCII_HEX_TABLE[bytes[i] % 16];

    }
    result
}

#[test]
fn some_test() {
    let outer_hash = 0x0d67824fead966192029093a3aa5c719f2b80262c4f14a5c97c5d70e4b27f2bf;
    let hex_challenge: [u8; 64] = to_hex_string_bytes(outer_hash);
    let header_prefix: [u8; 26] = "subject:Re: Tx request: 0x".as_bytes();
    let header: [u8; 90] = crate::array_concat(header_prefix, hex_challenge);
    assert(header == [115, 117, 98, 106, 101, 99, 116, 58, 82, 101, 58, 32, 84, 120, 32, 114, 101, 113, 117, 101, 115, 116, 58, 32, 48, 120, 48, 100, 54, 55, 56, 50, 52, 102, 101, 97, 100, 57, 54, 54, 49, 57, 50, 48, 50, 57, 48, 57, 51, 97, 51, 97, 97, 53, 99, 55, 49, 57, 102, 50, 98, 56, 48, 50, 54, 50, 99, 52, 102, 49, 52, 97, 53, 99, 57, 55, 99, 53, 100, 55, 48, 101, 52, 98, 50, 55, 102, 50, 98, 102]);
}
