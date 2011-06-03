// test function calls
function test(expected) {
  function n() {return 0;}
  function s() {return "0";}

  var f;
  f = n;
  f = s;
  return f();
}

var numOrStr;
numOrStr = 0;
numOrStr = "0";
test(numOrStr);
