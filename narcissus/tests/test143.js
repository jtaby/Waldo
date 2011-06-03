// assignment to stack ref updates heap as well
var a = [];

function test(expected) {
  return a.push(0);
}

test(0);
