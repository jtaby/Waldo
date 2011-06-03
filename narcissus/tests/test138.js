// this in fun calls bound to global obj
function test(expected) {
  this.Array.prototype.foo = 3;

  return (new Array()).foo;
}

test(0);
