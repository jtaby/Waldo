// delete throws
function test(expected) {
  function t() { throw new Error(); }

  try {
    delete t();
  }
  catch (e) {
    return e.message;
  }
}

test("");
