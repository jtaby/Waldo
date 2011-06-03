// property lookup in proto chain
function test(expected) {
  function Dad() {this.x = 5;}
  function Kid() {}

  Kid.prototype = new Dad();
  var k = new Kid();

  return k.x;
}

test(0);
