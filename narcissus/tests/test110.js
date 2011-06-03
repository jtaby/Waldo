// ARRAY_INIT throws
function test(expected) {
  function t() { throw new Error(); }

  try {
    [21, t()];
  }
  catch (e) {
    return e.message;
  }
}

test("");
