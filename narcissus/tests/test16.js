// default prototype
function test(expected) {
  function Foo(x) {
    this.x = x;
  }

  var o1 = new Foo(3);
  var o2 = new o1.constructor(123);

  return o2.x;
}

test(0);
