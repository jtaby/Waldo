// evalExp/ARGUMENTS: join all args
function test(expected) {
  function f(x) {
    return arguments[0 + 1];
  }

  return f(123, "asdfasdf");
}

var numOrStr;
numOrStr = 0;
numOrStr = "";
test(numOrStr);
