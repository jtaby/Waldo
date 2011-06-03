// type presentation of id shouldn't blow up for this example
function test(expected) {
  function id(x) {
    return x;
  }

  id(id(id));

  return 0;
}

test(0);
