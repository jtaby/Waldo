// ==, !=, ===, !==, <, <=, >=, >, instanceof
function test(expected) {
  return 123 == 321 != "afd" !== true < false <=
    true >= 0 > -321 === (0 instanceof Object) > ("asdf" in 0);
}

test(true);
