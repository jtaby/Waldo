// test comma
function test(expected) {
  var x, y;
  
  x = 4, (y = 5);
  return x + y;
}

test(0);
