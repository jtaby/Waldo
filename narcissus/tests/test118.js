// FOR_IN
function test(expected) {
  var a = {}, s, ret, p;

  s = "foo";
  s = "bar";
  a[s] = 123;

  for (p in a) ret = a[p];

  return ret;
}

test(0);
