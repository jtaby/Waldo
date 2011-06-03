function test(expected) {
  try {
    if (123)
      throw 123;
    else
      throw "";
  }
  catch (e) {
    return e;
  }
}

var numOrStr;
numOrStr = 0;
numOrStr = "";
test(numOrStr);
