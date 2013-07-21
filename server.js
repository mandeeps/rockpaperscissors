var express = require('express');
var fs = require('fs');

var rps = express.createServer(express.logger());

rps.use('/js', express.static(__dirname, '/js'));
rps.use('/css', express.static(__dirname, '/css'));

var text = fs.readFileSync('index.html');
rps.get('/', function(request, response) {
  response.writeHead(200);
  response.write(text);
  response.end();
});

var port = process.env.PORT || 80;
rps.listen(port, function() {
  console.log("Listening on " + port);
});
