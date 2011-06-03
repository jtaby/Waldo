// test Boolean inheritance
function test(expected) {
  Object.prototype.foo = 3;
  Function.prototype.bar = 4;

  return (new Boolean(123)).foo + Boolean.bar
}

test(0);
