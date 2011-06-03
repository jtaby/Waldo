// apply, when functions with different arities can be applied
function test(expected) {
  function f(x) { return x; }

  function h(x, y) { return y; }

  function G(y) { this.y = y; }

  var fun;
  fun = f;
  fun = h;

  return fun.apply(new G(1), [123]);
}

var numOrUndef;
numOrUndef = 0;
numOrUndef = undefined;
test(numOrUndef);
