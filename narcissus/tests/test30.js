// test Function and Function.prototype.prototype
function test(expected) {
  Function.prototype.foo = 3;
  Object.prototype.foo = "3";
  Object.prototype.bar = 3;

  return Function.foo + Function.prototype.prototype.bar;
}

test(0);
