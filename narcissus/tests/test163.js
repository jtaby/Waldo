// apply a built-in, arity 2
function test(expected) {
  var a = [1, 1, 1, 1];
  Array.prototype.slice.apply(a, [2, 3]);
  return a[2];
}

test(0);
