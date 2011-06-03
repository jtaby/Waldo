// apply, test fewer arguments
function test(expected) {
  function f(x, y, z) { return z; }

  function G(y) { this.y = y; }

  return f.apply(new G(1), [0, 1]);
}

test(undefined);
