// apply a built-in, arity 0 (variable arity function)
function test(expected) {
  var a = [];
  Array.prototype.push.apply(a, [2, 3, "4"]);
  return a[2];
}

var numOrStr;
numOrStr = 0;
numOrStr = "";
test(numOrStr);
