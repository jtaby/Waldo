// test Number & Number.prototype
function test(expected) {
  Object.prototype.foo = "";
  Object.prototype.bar = 123;
  Function.prototype.foo = 123;

  return Number.foo + Number.prototype.bar;
}

test(0);
