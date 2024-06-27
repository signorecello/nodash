# Nodash - Lodash for Noir

Nodash is a utility library for [Noir](https://github.com/noir-lang/noir) language.

## Installation

Put this into your Nargo.toml:

```toml
nodash = { git = "https://github.com/olehmisar/nodash", tag = "main" }
```

## Docs

### `sqrt`

```rs
use dep::nodash::math::sqrt::sqrt;

assert(sqrt(U128::from_integer(4)) == U128::from_integer(2));

// it floors the result
assert(sqrt(U128::from_integer(8)) == U128::from_integer(2));
```

### `min`

```rs
use dep::nodash::math::min;

assert(min(U128::from_integer(1), U128::from_integer(2)) == U128::from_integer(1));
```

### `max`

```rs
use dep::nodash::math::max;

assert(max(U128::from_integer(1), U128::from_integer(2)) == U128::from_integer(2));
```

### `clamp`

```rs
use dep::nodash::math::clamp;

// if too small, return min
assert(clamp(U128::from_integer(1), U128::from_integer(2), U128::from_integer(3)) == U128::from_integer(2));
// if too big, return max
assert(clamp(U128::from_integer(4), U128::from_integer(2), U128::from_integer(3)) == U128::from_integer(3));
// if in range, return value
assert(clamp(U128::from_integer(2), U128::from_integer(2), U128::from_integer(3)) == U128::from_integer(2));
```
