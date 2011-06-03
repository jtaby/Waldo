// plus-right throws
function test(expected) {
  function t() {throw new Error("asdfaafs");}

  try {
    123 + t();
  }
  catch (e) {
    return e.message;
  }
}

test("");
