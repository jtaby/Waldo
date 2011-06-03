// |, ^, &, <<, >>, >>>
function test(expected) {
  return 123 | 321 ^ "afd" << true >> false >>> true;
}

test(0);
