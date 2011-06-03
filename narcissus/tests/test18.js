// properties correctly not merged
function test(expected) {
  function Foo(){}

  var o = new Foo();
  o[1] = 123;
  o[2] = "asdf";
  return o[1];
}

test(0);
