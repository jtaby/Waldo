// Array.prototype.push
function test(expected) {
  var a = new Array();
  a.push(0, "");
  var i = 0;
  return a[i];
}

var numOrStr;
numOrStr = 0;
numOrStr = "";
test(numOrStr);
