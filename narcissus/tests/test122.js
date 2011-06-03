// the type of a must be Array[number]
function test(expected) {
  var a = new Array(10);
  for (var i = 0; i < 10; i++) a[i] = 123;
  
  function f(i, a) { return a[i]; }

  return f(2, a);
}

test(0);
