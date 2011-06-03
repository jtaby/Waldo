// test op-and-assign operators
function test(expected) {
  var x = 0;
  x += 123;
  x -= 123;
  x *= 123;
  x /= 123;
  x %= 123;
  x <<= 123;
  x >>= 123;
  x >>>= 123;
  x &= 123;
  x ^= 123;
  x |= 123;
  return x;
}

test(0);
