// test inheritance in Array and Array.prototype
function test(expected) {
  Function.prototype.foo = 0;
  Object.prototype.bar = 0;
  return Array.foo + Array.prototype.bar;
}

test(0);
