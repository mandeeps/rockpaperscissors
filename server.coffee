# server.coffee
express = require 'express'
app = express()
mongoose = require 'mongoose'
mongoose.connect process.env.MONG #'mongodb://127.0.0.1:27017/rps'
port = process.env.PORT || 8080

allowCORS = (req, res, next) ->
	res.header('Access-Control-Allow-Origin', '*')
	res.header('Access-Control-Allow-Methods', 'GET,PUT,POST,DELETE,OPTIONS')
	res.header('Access-Control-Allow-Headers', 'Content-Type, Authorization, Content-Length, X-Requested-With')

	if ('OPTIONS' == req.method) 
    	res.send 200
    else
    	next()

app.configure ->
	app.use express.static __dirname + '/public'
	app.use express.logger 'dev'
	app.use express.bodyParser()
	app.use express.methodOverride()
	app.use allowCORS

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
						res.json account
					)
				else
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

	app.listen port
	console.log 'running on ' + port