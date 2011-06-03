// define a highly recursive function to exercise the exception 
// throwing part of the analysis
function test(expected) {
  var o = new Object();

  function r(x) {
    o.foo = x;
    if (123)
      r("");
    else
      r(true);
    o.bar = x + 431;
    return r([]);
  }

  r(123);
  return o.bar;
}

var numOrStr;
numOrStr = 0;
numOrStr = "";
test(numOrStr);
