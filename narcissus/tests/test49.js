// String.prototype methods that return a string
function test(expected) {
  var s = new String("asdfaf");
  return s.charAt() + s.slice(0,0) + s.substr(0,0) + s.substring(0,0);
}

test("");
