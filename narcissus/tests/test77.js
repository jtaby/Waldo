// evalExp/ARGUMENTS: no extra args but use arguments
function test(expected) {
  function f(x) {
    var n = 0;
    return arguments[0] + arguments[n];
  }

  return f(123);
}

test(0);
