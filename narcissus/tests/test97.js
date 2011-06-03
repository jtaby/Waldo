// |, ^, &, <<, >>, >>> throw
function test(expected) {
  function t() { throw new Error(); }

  try {
    123 | t() ^ "afd" << true >> t() >>> t();
  }
  catch (e) {
    return e.message;
  }
}

test("");
