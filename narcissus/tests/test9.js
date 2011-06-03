function test(expected) {
  
  function Foo(x) {
    this.x = x;
  }

  var o = new Foo(0);
  o = new Foo("asdf");
  return o.x;
}

var numOrStr;
numOrStr = 0;
numOrStr = "0";
test(numOrStr);
