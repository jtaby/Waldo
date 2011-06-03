// apply, test more arguments
function test(expected) {
  function f(x) { return arguments[2]; }

  function G(y) { this.y = y; }

  return f.apply(new G(1), [0, 1, 2]);
}

test(0);
