// unary_plus, unary_minus, ++, -- throw
function test(expected) {
  function t() { throw new Error(); }
  
  try {
    return + 1234 - 543 + (t()++) - (-t()--);
  }
  catch (e) {
    return e.message;
  }
}

var numOrStr;
numOrStr = 0;
numOrStr = "";
test(numOrStr);
