// RegExp and RegExp.prototype
function test(expected) {
  Object.prototype.foo = 123;
  Function.prototype.bar = 123;

  return (new RegExp()).foo + RegExp.bar;
}

test(0);
