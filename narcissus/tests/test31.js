// test Object constructor w/out new
function test(expected) {
  var x = Object.prototype;
  x.foo = 0;
  var o = Object();
  return o.foo;
}

test(0);
