//evalExp/TYPEOF throws
function test(expected) {
  function t() { throw new Error(); }

  try {
    typeof t();
  }
  catch (e) {
    return e.message;
  }
}

test("");
