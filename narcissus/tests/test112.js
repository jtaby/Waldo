// RegExp.prototype.test
function test(expected) {
  return (new RegExp()).test("asfasdf") || /abc/.test("a");
}

test(true);
