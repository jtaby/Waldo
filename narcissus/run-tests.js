// How to write a test:
// Have one toplevel function called test that takes one argument.
// The type of the argument is the expected type of the result.
// The argument should not be used in the body of the function.
// Put your test in the body of "test" and return a value.
// The type of the return value is compared to the type of the argument.

var readFileSync = require('fs').readFileSync;
var print = require('sys').puts;
var runtest = require('./jscfa').runtest;
var parse = require('./jsparse').parse;
var numAll = process.argv[3], start, end;

function testname(num) { return "./tests/test" + num + ".js"; } 

if (process.argv[2] === "some") {
  var range = process.argv[4], dash = range.indexOf("-");
  if (dash === -1) 
    start = end = range; // run a single test
  else { // run a susbet of the tests
    start = Number(range.substring(0, dash)) || 1;
    if (dash === (range.length - 1))
      end = numAll;
    else
      end = Number(range.substring(dash + 1, range.length));  
  }
 }
 else { // run all tests
   start = 1;
   end = numAll;
 }

var failed_tests = [];
for (var i = start; i <= end; i++) {
  var tn = testname(i);
  if (!runtest(parse(readFileSync(tn), tn, 1))) failed_tests.push(i);
 }

print("\n");
print("Number of tests: " + (end - start + 1));
var numFailed = failed_tests.length;
if (numFailed !== 0) {
  print("Number of failed tests: " + numFailed);
  for (var i = 0, len = numFailed; i < len; i++) print(failed_tests[i]);
 }
 else print("All tests passed.");
print("\n");
