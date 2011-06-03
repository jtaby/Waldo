// && throws, join the two errors
function test(expected) {
  function E1(){this.foo = 0;}
  E1.prototype = new Error();

  function E2(){this.foo = "";}
  E2.prototype = new Error();

  function t(e) { throw e; }

  try {
    (t(new E1()) + 123) && t(new E2());
  }
  catch (e) {
    return e.foo;
  }
}

var numOrStr;
numOrStr = 0;
numOrStr = "";
test(numOrStr);
