// catch-var isn't merged in frame with other vars of the same name.
function test(expected) {
  var e = "adfasdf";
  try {
    throw 0;
  }
  catch (e) {
    return e;
  }
}

test(0);
