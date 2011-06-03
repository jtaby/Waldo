// test += on strings
function test(expected) {
  var x = 0;
  x += "asdf";

  return x;
}

var numOrStr;
numOrStr = 0;
numOrStr = "";
test(numOrStr);
