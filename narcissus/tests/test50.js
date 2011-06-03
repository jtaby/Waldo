// String.prototype methods that return a number
function test(expected) {
  var s = new String("asdfaf");
  return s.charCodeAt(0) + s.indexOf("f") + s.lastIndexOf("f");
}

test(0);
