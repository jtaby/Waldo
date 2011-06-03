function test(expected) {
  var a = new Array(10, "1");
  a.shift();
  return a[0];
}

var numOrStr;
numOrStr = 0;
numOrStr = "";
test(numOrStr);
