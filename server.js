(function() {
  var Player, app, express, mong;

  express = require('express');

  app = express();

  mong = require('mongoose');

  mong.connect('mongodb://127.0.0.1:27017');

  app.configure(function() {
    return app.use(express.static(__dirname + '/'));
  });

  Player = mong.model('Player', {
    text: String
  });

  app.get('/api/players', function(req, res) {
    return Player.find(function(err, players) {
      if (err) res.send(err);
      return res.json(players);
    });
  });

  app.post('/api/players', function(req, res) {
    Player.create({
      text: req.body.text,
      done: false
    });
    (function(err, players) {
      if (err) return res.send(err);
    });
    return Player.find(function(err, players) {
      if (err) res.send(err);
      return res.send(players);
    });
  });

  app["delete"]('/api/players/:player_id', function(req, res) {
    Player.remove({
      _id: req.params.player_id
    });
    (function(err, player) {
      if (err) return res.send(err);
    });
    return Player.find(function(err, players) {
      if (err) res.send(err);
      return res.json(players);
    });
  });

  app.listen(8080);

  console.log('running on 8080');

}).call(this);
