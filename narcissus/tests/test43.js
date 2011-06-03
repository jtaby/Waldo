// Array.prototype.unshift
function test(expected) {
  var a = new Array();
  return a.unshift(1, "");
}

test(0);
