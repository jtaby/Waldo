// expr that throws: function call
function test(expected) {
  function t() {throw new Error("asdfaafs");}

  try {
    t();
  }
  catch (e) {
    return e.message;
  }
}

test("");
