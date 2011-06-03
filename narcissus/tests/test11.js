// test funs in expr context, method calls
function test(expected) {
  function Foo() {}
  var o = new Foo();
  o.m = function id(x) {return x;}
  return o.m(0);
}

test(0)
