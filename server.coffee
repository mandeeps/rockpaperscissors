# server.coffee
express = require 'express'
app = express()
mongoose = require 'mongoose'
mongoose.connect 'mongodb://test:test@linus.mongohq.com:10083/rps' #'mongodb://127.0.0.1:27017/rps'

app.configure ->
	app.use express.static __dirname + '/public'
	app.use express.logger 'dev'
	app.use express.bodyParser()
	app.use express.methodOverride()

db = mongoose.connection
db.on 'error', console.error.bind console, 'connection error:'
db.once 'open', () ->

	Player = mongoose.model 'Player', 
		name: String,
		winCount: Number,
		lossCount: Number,
		tieCount: Number

	app.put '/api/players/:person', (req, res) ->
		console.log 'get request for one account'
		console.log req.params
		Player.findOne {'name': req.params.person}, (err, account) ->
			if err
				res.send err
			else
				if !account?
					Player.create({
						name: req.params.person,
						winCount: 0,
						lossCount: 0,
						tieCount: 0
					}, (err, account) ->
						if err
							res.send err
					)
				res.json account
				console.log 'account: ' + account
	
	app.get '/api/players', (req, res) ->
		Player.find {}, null, {sort: {winCount:-1}, limit:3}, (err, players) ->
			if err
				res.send err
				console.log err
			res.json players

	app.post '/api/players', (req, res) ->
		console.log 'update one account'
		console.log req.body
		Player.findOneAndUpdate {'name': req.body.name}, {$set: {winCount:req.body.winCount,lossCount:req.body.lossCount,tieCount:req.body.tieCount}}, (err, player) ->
			if err
				res.send err

	app.get '*', (req, res) ->
		res.sendfile './public/index.html'

	app.listen 8080
	console.log 'running on 8080'