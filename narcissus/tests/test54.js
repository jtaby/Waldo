// Error and properties
function test(expected) {
  try {
    throw new Error("asdfadf");
  }
  catch (e) {
    return e.toString() + e.name + e.message;
  }
}

test("");
