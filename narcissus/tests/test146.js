// apply, the obj bound to this is affected
function test(expected) {
  function f() {
    this.foo = "asdf";
  }

  function G(y) { this.y = y; }

  var g = new G(1);
  f.apply(g);
  return g.foo;
}

test("");
