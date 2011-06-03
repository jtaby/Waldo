// Function.prototype.call, more arguments
function test(expected) {
  function f(x) { return arguments[1]; }

  return f.call(new Object(), 2, "123");
}

test("");
