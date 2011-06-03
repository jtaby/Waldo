// test plus
function test(expected) {
  var x;
  x = 0;
  x = "0";
  return x + 0;
}

var numOrStr;
numOrStr = 0;
numOrStr = "0";
test(numOrStr);

