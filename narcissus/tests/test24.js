function test(expected) {
  var x = Object.prototype;
  x.foo = 0;
  return x.foo;
}

test(0);
