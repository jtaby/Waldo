function test(expected) {
  function Foo(x) {this.x = x;}
  
  var o = new Foo(3);
  return o["x"];
}

test(0);
