// evalExp/ARGUMENTS: negative index
function test(expected) {
  function f(x) {
    return arguments[-1];
  }

  return f(123);
}

test((new Object()).propdoesntexist);
