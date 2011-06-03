// test String constructor
function test(expected) {
  var s = new String("asdfaf");
  return s.valueOf() + s.toString();
}

test("");
