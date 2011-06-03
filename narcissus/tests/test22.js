// unsoundness due to not detecting implicit "return undefined"
function test(expected) {
  if (2 - 2)
    return 1;
}

test(0);
