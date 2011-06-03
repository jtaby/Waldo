// OBJECT_INIT throws
function test(expected) {
  function t() { throw new Error(); }

  try {
    ({a:1, b:2, c:t()}).a;
  }
  catch (e) {
    return e.message;
  }
}

test("");
