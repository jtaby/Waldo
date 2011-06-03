// test merging of numeric properties
function test(expected) {
  function Foo(){}

  var o = new Foo();
  var i = 1;
  o[1] = 123;
  o[i] = "asdf";
  return o[i];
}

var numOrStr;
numOrStr = 0;
numOrStr = "";
test(numOrStr);
