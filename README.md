# Nodash - Lodash for Noir

Nodash is a utility library for [Noir](https://github.com/noir-lang/noir) language.

## Installation

Put this into your Nargo.toml.

If you are using Noir:

```toml
nodash = { git = "https://github.com/olehmisar/nodash/", tag = "noir-v0.31.2" }
```

If you are using Aztec:

```toml
nodash = { git = "https://github.com/olehmisar/nodash/", tag = "aztec-v0.46.7" }
```

## Docs

### `math::sqrt`

```rs
use nodash::math::sqrt::sqrt;

assert(sqrt(4 as u64) == 2);

// it floors the result
assert(sqrt(8 as u64) == 2);
```

### `math::clamp`

```rs
use nodash::math::clamp;

// if too small, return min
assert(clamp(1 as u64, 2 as u64, 3 as u64) == 2 as u64);
// if too big, return max
assert(clamp(4 as u64, 1 as u64, 3 as u64) == 3 as u64);
// if in range, return value
assert(clamp(2 as u64, 1 as u64, 3 as u64) == 2 as u64);
```

### `solidity::encode_with_selector`

Equivalent to `abi.encodeWithSelector` in Solidity.

_Note: due to Noir limitations, you have to pass the result array as the last argument. The length of the array should be `4 + N * 32` where `N` is the number of arguments. In the example below, `4 + 2 * 32 == 68`_

```rs
use nodash::solidity::encode_with_selector;

let selector: u32 = 0xa9059cbb; // transfer(address,uint256)
let args: [Field; 2] = [
  0xd8dA6BF26964aF9D7eEd9e03E53415D37aA96045, // address
  123 // uint256
];
let encoded = encode_with_selector(selector, args, [0; 68]);
// typeof encoded: [u8; 68]
```
