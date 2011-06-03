function fill(s) {
  var req = new XMLHttpRequest();  
  req.open("GET", s, false);
  req.send(null);  
  if ((req.status == 200) || (req.status == 0)) {
    var textarea = document.getElementById("js");
    textarea.value = req.responseText;
  }
}

function gettypes() {
  var textarea = document.getElementById("js");
  var src = document.getElementById("js").value;
  var lines = src.split("\n");
  var ast = parse(src, "js", 1);
  var tags = getTags(ast, "js", lines, {});
  var result = document.getElementById("types");

  tags.sort(function(t1, t2) {
      var l1 = t1.lineno, l2 = t2.lineno;
      return l1 - l2;
    });

  var colnames = document.getElementById("colnames");
  colnames.style.visibility = "visible";

  for (var i = 1, l = result.rows.length; i < l; i++)
    result.deleteRow(-1);

  result.style.fontFamily = "sans-serif";
  tags.forEach(function(t) {
      var row = result.insertRow(-1);
      var cell = row.insertCell(0);
      cell.textContent = t.lineno;
      cell = row.insertCell(1);
      cell.textContent = t.name;
      cell = row.insertCell(2);
      cell.textContent = t.type;
    });
}

