// unary_plus, unary_minus, ++, --
function test(expected) {
  return + 1234 - 543 + (8++) - (-1234--);
}

test(0);
