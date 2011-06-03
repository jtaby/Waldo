// hook
function test(expected) {
  return true ? 123 : "";
}

var numOrStr;
numOrStr = 0;
numOrStr = "";
test(numOrStr);
