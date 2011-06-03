// a function that doesn't use return returns undefined. Because of relaxed
// control-flow we can't tell that t never returns.
function test(expected) {
  function t() { throw new Error(); }

  try {
    return t();
  }
  catch (e) {

  }
}

test(undefined);
