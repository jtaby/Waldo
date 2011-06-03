function test(expected) {
  var a = [1, 2, 3];

  return a.concat(4, ["5", "6"])[0];
}

var numOrStr;
numOrStr = 0;
numOrStr = "";
test(numOrStr);
