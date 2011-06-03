// reorder branches to put recursion in the THEN branch.
function test(expected) {
  function recur(n) {
    if (123)
      return n + recur(n - 1);
    else
      return 1;
  }

  return recur(0);
}

test(0);