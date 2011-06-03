// Function.prototype.call
function test(expected) {
  function f(x) { return x; }

  return f.call(new Object(), 3);
}

test(0);
