// evalLval/INDEX: n[1] throws
function test(expected) {
  function t() {throw new Error("asdfaafs");}

  function Foo() {this.foo = 123;}

  try {
    (new Foo())[t()] = 123;
  }
  catch (e) {
    return e.message;
  }
}

test("");
