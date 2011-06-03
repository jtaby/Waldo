// ||
function test(expected) {
  function Foo(){}

  return (new Foo()).foo || 123;
}

test(0);
