// unsoundness because loops aren't iterated to fixpt
function test(expected) {
  var x, y;
  for (;;) {
    x = 1;
    y = x;
    x = "asdf";
  }

  return y;
}

test(0);
