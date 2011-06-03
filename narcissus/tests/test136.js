function test(expected) {
  return Infinity + NaN + parseInt("asdf");
}

test(0);
