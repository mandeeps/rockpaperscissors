# server.coffee
express = require 'express'
app = express()
mongoose = require 'mongoose'
mongoose.connect 'mongodb://127.0.0.1:27017/rps'

app.configure ->
	app.use express.static __dirname + '/public'
	app.use express.logger 'dev'
	app.use express.bodyParser()
	app.use express.methodOverride()

db = mongoose.connection
db.on 'error', console.error.bind console, 'connection error:'
db.once 'open', () ->

	Player = mongoose.model 'Player', 
		name: String

	app.get '/api/players', (req, res) ->
		Player.find (err, players) ->
			if err
				res.send err
			res.json players 

	app.post '/api/players', (req, res) ->
		Player.create({
			name: req.body.name,
			done: false
		}, (err, player) ->
			if err
				res.send err
			Player.find (err, players) ->
				if err
					res.send err
				res.send players
		)

		console.log req.body.name

	app.delete '/api/players/:player_id', (req, res) ->
		Player.remove
			_id: req.params.player_id,
		(err, player) ->
			if err
				res.send err

		Player.find (err, players) ->
			if err
				res.send err
			res.json players

	#app.get '*', (req, res) ->
	#	res.sendfile './public/index.html'

	app.listen 8080
	console.log 'running on 8080'