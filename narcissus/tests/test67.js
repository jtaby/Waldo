// evalExp/COMMA: last throws
function test(expected) {
  function t() {throw new Error("asdfaafs");}

  try {
    321, t();
  }
  catch (e) {
    return e.message;
  }
}

test("");
