function test(expected) {
  var o = new Object();
  o.foo = 123;
  var o2 = new o.valueOf();
  o2.bar = "123";
  return o2.bar;
}

test("");
