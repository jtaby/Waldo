// evalFun: call fun w/ fewer args
function test(expected) {
  function f(x) {}

  f();
  return 0;
}

test(0);
