(function() {
  "use strict";
  var main;

  window.addEventListener('load', function() {
    return FastClick.attach(document.body);
  }, false);

  main = angular.module('RPS', []);

  main.service('sharedData', function() {
    this.name = function() {
      return 'name';
    };
    this.choice = function() {
      return 'choice';
    };
    return this.view = 'partials/about.html';
  });

  main.controller('Partials', function($scope, sharedData) {
    return $scope.data = sharedData;
  });

  main.controller('AskName', function($scope, sharedData) {
    $scope.message = 'Hello, what is your name?';
    $scope.name = 'Player';
    return $scope.submit = function() {
      if ($scope.name != null) sharedData.name = $scope.name;
      if ($scope.name != null) return sharedData.view = 'partials/choice.html';
    };
  });

  main.controller('ChooseRPS', function($scope, sharedData) {
    $scope.message = "OK " + sharedData.name + "! Choose Rock, Paper or Scissors!";
    $scope.images = {
      rock: {
        image: 'static/rock.svg',
        name: 'rock'
      },
      paper: {
        image: 'static/paper.svg',
        name: 'paper'
      },
      scissors: {
        image: 'static/scissors.svg',
        name: 'scissors'
      }
    };
    return $scope.select = function(choice) {
      sharedData.choice = choice;
      return sharedData.view = 'partials/end.html';
    };
  });

  main.controller('Final', function($scope, sharedData, $http) {
    var rand, result, select;
    $scope.name = sharedData.name;
    $scope.choice = sharedData.choice;
    select = ['rock', 'paper', 'scissors'];
    rand = Math.floor(Math.random() * select.length);
    $scope.comp = select[rand];
    if (sharedData.choice === $scope.comp) result = 'tied';
    if (sharedData.choice === 'rock' && $scope.comp === 'paper') result = 'lose';
    if (sharedData.choice === 'rock' && $scope.comp === 'scissors') result = 'win';
    if (sharedData.choice === 'paper' && $scope.comp === 'rock') result = 'win';
    if (sharedData.choice === 'paper' && $scope.comp === 'scissors') {
      result = 'lose';
    }
    if (sharedData.choice === 'scissors' && $scope.comp === 'rock') {
      result = 'lose';
    }
    if (sharedData.choice === 'scissors' && $scope.comp === 'paper') {
      result = 'win';
    }
    $scope.message = sharedData.name + ', you ' + result + '!';
    $http.get('/api/players').success(function(data) {
      console.log(data);
      return $http.post('/api/players', {
        text: 'text'
      }).success(function(data) {
        return console.log(data);
      });
    });
    return $scope.click = function() {
      return sharedData.view = 'partials/choice.html';
    };
  });

  main.controller('about', function($scope, sharedData) {
    return $scope.click = function() {
      return sharedData.view = 'partials/play.html';
    };
  });

}).call(this);
