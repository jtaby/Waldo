// evalFun: call fun w/ more args
function test(expected) {
  function f() {}

  f(1, 2, 3);
  return 0;
}

test(0);
