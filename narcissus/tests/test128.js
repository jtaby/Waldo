// test Math inheritance
function test(expected) {
  Object.prototype.foo = 3;
  Object.bar = 4;

  return Math.constructor.bar + Math.foo;
}

test(0);
