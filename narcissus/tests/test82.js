// THROW's exp throws
function test(expected) {
  function t() { throw new Error(); }
  
  try {
    throw t();
  }
  catch (e) {
    return e.message;
  }
}

test("");
