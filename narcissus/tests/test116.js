// += lhs throws
function test(expected) {
  function t() { throw new Error(); }

  try {
    (new Array(123))[t()] += 123;
  }
  catch (e) {
    return e.message;
  }
}

test("");
