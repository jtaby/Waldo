// test Object constructor
function test(expected) {
  var x = Object.prototype;
  x.foo = 0;
  var o = new Object();
  return o.foo;
}

test(0);
