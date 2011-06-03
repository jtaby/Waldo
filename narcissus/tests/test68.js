// evalExp/COMMA: join exceptions
function test(expected) {
  function E1(){this.msg = 1;}
  E1.prototype = new Error();

  function E2(){this.msg = "1";}
  E2.prototype = new Error();

  function t(e){throw e;}
  
  try {
    t(new E1()), t(new E2());
  }
  catch (e) {
    return e.msg;
  }
}

var numOrStr;
numOrStr = 0;
numOrStr = "";
test(numOrStr);
