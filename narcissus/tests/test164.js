// properties of regexps defined correctly
function test(expected) {
  return /asdf/.global;
}

test(true);
