// apply
function test(expected) {
  function f(x) {return x;}

  function G(y) { this.y = y; }

  return f.apply(new G(1), [4, 5, 6]);
}

test(0);
