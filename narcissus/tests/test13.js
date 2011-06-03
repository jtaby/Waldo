function test(expected) {
  function recur(n) {
    if (123)
      return 1;
    else
      return n + recur(n - 1);
  }

  return recur(0);
}

test(0);
