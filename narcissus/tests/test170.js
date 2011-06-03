// test that the toplevel env binds THIS
function test(expected) {
  return 123;
}

var globalobj = this;
test(123);
