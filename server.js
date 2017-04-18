var express = require('express');
var path = require('path');

let app = express();

app.use(express.static(path.join(__dirname, 'dist')));
// app.set("view engine", "html");

app.get("*", function (req, res) {
  res.sendFile(path.join(__dirname+'/dist/index.html'));
});

app.listen(3000, function() {
  console.log("Server listening on 3000");
})