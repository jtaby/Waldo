// ||
function test(expected) {
  return 123 || "";
}

var numOrStr;
numOrStr = 0;
numOrStr = "";
test(numOrStr);
