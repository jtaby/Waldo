// &&
function test(expected) {
  function Foo(){}

  return (new Foo()).foo && 123;
}

function Bar() {}
test((new Bar()).propertydoesntexist);
