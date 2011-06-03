// apply, when the array properties have been merged
function test(expected) {
  function f(x) { return x; }

  function G(y) { this.y = y; }

  var a = [];
  a.push(0);
  a.push("");
  
  return f.apply(new G(1), a);
}

var numOrStr;
numOrStr = 0;
numOrStr = "";
test(numOrStr);
