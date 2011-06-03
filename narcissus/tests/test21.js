// doesn't merge generic num & str properties
function test(expected) {
  function Foo(){}

  var o = new Foo();
  var i = 1, s = "asdf";
  o[i] = 123;
  o[s] = "foo";

  return o[s];
}

test("0");
