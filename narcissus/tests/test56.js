// Error and inheritance
function test(expected) {
  Error.prototype.foo = 123;
  Error.bar = 345;
  try {
    throw new Error("asdfadf");
  }
  catch (e) {
    return e.foo + e.constructor.bar;
  }
}

test(0);
