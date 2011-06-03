// unsoundness in Array.prototype.pop
function test(expected) {
  var a = new Array("1","2","3");
  a.pop();
  return a[2];
}

test("");
