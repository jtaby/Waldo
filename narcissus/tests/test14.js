// test prototype property in evalExp
function test(expected) {
  function F(){}
  F.prototype.num = 0;

  var x = new F();
  x.prototype = 431;

  return F.prototype.num + x.prototype;
}

test(0);
