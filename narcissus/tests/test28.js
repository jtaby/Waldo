function test(expected) {
  var o = new Object();
  o.foo = 123;
  return o.valueOf().foo;
}

test(0);
