// unsound: can't tell that x may not be init'd, so we may return undefined.
function test(expected) {
  var x;
  try {
    throw 0;
    x = "fadas";
  }
  catch (e) {
  }
  return x;
}

test("");
