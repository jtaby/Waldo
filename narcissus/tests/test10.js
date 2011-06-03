// "that" mutated in heap before accessed from stack, tricky case
function test(expected) {
  var that;
  
  function Foo(x) {
    this.x = x;
    that = this;
    return 42;
  }

  var num = new Foo(0);
  return that.x + num;
}

test(0);

