// apply, one of the functions throws
function test(expected) {
  function f(x) { return x; }

  function h(x, y) { throw new Error("adasaf"); }

  function G(y) { this.y = y; }

  var fun;
  fun = f;
  fun = h;

  try {
    return fun.apply(new G(1), [123]);
  }
  catch(e) {
    return e.message;
  }
}

var numOrStrOrUndef;
numOrStrOrUndef = 0;
numOrStrOrUndef = "";
numOrStrOrUndef = undefined;
test(numOrStrOrUndef);
