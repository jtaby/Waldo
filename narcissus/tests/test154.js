// Function.prototype.call, fewer arguments
function test(expected) {
  function f(x) { return x; }

  return f.call(new Object());
}

test(undefined);
