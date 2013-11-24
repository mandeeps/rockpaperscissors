# server.coffee
express = require 'express'
app = express()
mong = require 'mongoose'
mong.connect 'mongodb://127.0.0.1:27017'

app.configure ->
	app.use express.static __dirname + '/'
	#app.use express.logger 'dev'
	#app.use express.bodyParser()
	#app.use express.methodOverride()

Player = mong.model 'Player', 
	text: String

app.get '/api/players', (req, res) ->
	Player.find (err, players) ->
		if err
			res.send err
		res.json(players) 

app.post '/api/players', (req, res) ->
	Player.create
		text: req.body.text,
		done: false,
	(err, players) ->
		if err
			res.send err

	Player.find (err, players) ->
		if err
			res.send err
		res.send players

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



app.listen 8080
console.log 'running on 8080'