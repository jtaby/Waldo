// minus-left throws
function test(expected) {
  function t() {throw new Error("asdfaafs");}

  try {
    t() - 123;
  }
  catch (e) {
    return e.message;
  }
}

test("");
