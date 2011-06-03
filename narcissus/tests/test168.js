//no problem to analyze this, but printing its type causes looping.
function test(expected) {
  function id(x) {
    return x;
  }
  
  var x = [];
  x[0] = x;

  id(x);
}

test(foo);
