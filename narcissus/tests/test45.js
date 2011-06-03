// test Number constructor
function test(expected) {
  var n = new Number(123);
  return n.valueOf() + Number("foobar");
}

test(0);
