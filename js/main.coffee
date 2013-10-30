"use strict"
main = angular.module('RPS',[]) #'ui.bootstrap'
  .config ($routeProvider) ->
    $routeProvider
      .when('/play', {templateUrl: 'partials/play.html', controller: 'AskName'})
      .when('/choice', {templateUrl: 'partials/choice.html', controller: 'ChooseRPS'})
      .when('/end', {templateUrl: 'partials/end.html', controller: 'Final'})
      .when('/about', {templateUrl: 'partials/about.html', controller: 'about'})
      .otherwise {redirectTo: '/about'}

main.service 'sharedData', ->
  this.name = ->
    return 'name'
  this.choice = ->
    return 'choice'

main.controller 'AskName', ($scope, sharedData, $location) ->
  $scope.message = 'Hello, what is your name?'
  $scope.name = 'Player'
  $scope.submit = ->
    sharedData.name = $scope.name
    $location.path 'choice'

main.controller 'ChooseRPS', ($scope, sharedData, $location) ->
  $scope.message = "OK " + sharedData.name + "! Choose Rock, Paper or Scissors!"
  $scope.images =
    rock:
      image: 'static/rock.svg'
      name: 'rock'
    paper:
      image: 'static/paper.svg'
      name: 'paper'
    scissors:
      image: 'static/scissors.svg'
      name: 'scissors'

  $scope.select = (choice) ->
    sharedData.choice = choice
    $location.path 'end'

main.controller 'Final', ($scope, sharedData, $location) ->
  $scope.name = sharedData.name
  $scope.choice = sharedData.choice
  select = ['rock', 'paper', 'scissors']
  rand = Math.floor(Math.random() * select.length)
  $scope.comp = select[rand]
  if sharedData.choice is $scope.comp then result = 'tied'
  if sharedData.choice is 'rock' and $scope.comp is 'paper' then result = 'lose'
  if sharedData.choice is 'rock' and $scope.comp is 'scissors' then result = 'win'
  if sharedData.choice is 'paper' and $scope.comp is 'rock' then result = 'win'
  if sharedData.choice is 'paper' and $scope.comp is 'scissors' then result = 'lose'
  if sharedData.choice is 'scissors' and $scope.comp is 'rock' then result = 'lose'
  if sharedData.choice is 'scissors' and $scope.comp is 'paper' then result = 'win'
  $scope.message = sharedData.name + ', you ' + result + '!'
  $scope.click = ->
    $location.path 'choice'

main.controller 'about', ($scope, $location) ->
  $scope.click = ->
    $location.path 'play'