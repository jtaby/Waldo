// FOR_IN with VAR
function test(expected) {
  var a = {}, s, ret;

  s = "foo";
  s = "bar";
  a[s] = 123;

  for (var p in a) ret = a[p];

  return ret;
}

test(0);
