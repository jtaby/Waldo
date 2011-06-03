// forces funToType to be called with a built-in function
function test(expected) {
  function foo(x) {
    return 123;
  }

  return foo(Object);
}

test(0);
