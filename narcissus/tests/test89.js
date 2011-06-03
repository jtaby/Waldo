// ! throws
function test(expected) {
  function t() { throw new Error(); }

  try { !t(); }
  catch (e) { return e.message; }
}

test("");
