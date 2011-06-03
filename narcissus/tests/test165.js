// at the 2nd call to t the summary is used, exception must be in summary
function test(expected) {
  function t() { throw new Error(); }

  try { t(); } catch (e) { }

  try { t(); } catch (e) { return e.message; }
}

test("");
