// test heap reference
function test(expected) {
  var x;

  function foo(y) {
    x = y;
    return x;
  }

  foo(23);
  return foo("asdfasf");
}

var numOrStr;
numOrStr = 0;
numOrStr = "0";
test(numOrStr);
