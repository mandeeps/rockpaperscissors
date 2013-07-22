express = require 'express'
fs = require 'fs'

rps = express express.logger()
rps.use express.static __dirname + '/static'

text = fs.readFileSync 'index.html'
rps.get('/', (request, response) -> 
  response.writeHead 200
  response.write text
  response.end()
)

port = process.env.PORT || 8080
rps.listen(port, -> 
  console.log("Listening on " + port)
)


