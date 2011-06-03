// evalExp/ARGUMENTS: too large index (unsound)
function test(expected) {
  function f() {
    return arguments[1];
  }

  return f(123);
}

test(0);
