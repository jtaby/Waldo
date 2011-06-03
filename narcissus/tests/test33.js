// test Array constructors with new
function test(expected) {
  var a1 = new Array();
  var a2 = new Array(123);
  var a3 = new Array(0, "asdf");
  return a3[0]; // array elms aren't merged
}

test(0);
