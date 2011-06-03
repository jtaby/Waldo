// delete
function test(expected) {
  var b = true;
  b = void 0;
  return delete b;
}

var boolOrUndef;
boolOrUndef = false;
boolOrUndef = (new Object()).nonexistentproperty;
test(boolOrUndef);
