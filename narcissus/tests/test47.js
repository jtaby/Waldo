// test String & String.prototype
function test(expected) {
  Object.prototype.foo = "";
  Object.prototype.bar = 123;
  Function.prototype.foo = 123;

  return String.foo + String.prototype.bar;
}

test(0);
