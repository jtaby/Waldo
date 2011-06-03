// evalExp/ARGUMENTS throws
function test(expected) {
  function t() { throw new Error(); }
  
  function f(x) { return arguments[t()]; }

  try {
    f(432);
  }
  catch (e) {
    return e.message;
  }
}

test("");
