// apply a built-in, arity 0
function test(expected) {
  return Array.prototype.pop.apply([123, 123]);
}

test(0);
