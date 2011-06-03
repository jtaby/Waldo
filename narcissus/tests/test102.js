// void throws
function test(expected) {
  function t() { throw new Error(); }

  try { void t() }
  catch (e) { return e.message; }
}

test("");
