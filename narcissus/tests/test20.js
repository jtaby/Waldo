function test(expected) {
  function Foo(){}

  var o = new Foo();
  var i = 1;
  o[i] = 123;
  return o[i];
}

test(0);
