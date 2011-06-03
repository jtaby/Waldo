// recursive calls return bottom, not undefined
function test(expected) {
  function ack(m,n){
    if (m==0) { return n+1; }
    if (n==0) { return ack(m-1,1); }
    return ack(m-1, ack(m,n-1));
  }

  var ret = 0;
  for (var i = 3; i <= 5; i++)
    ret += ack(3, i);
  return ret;
}

test(0);
