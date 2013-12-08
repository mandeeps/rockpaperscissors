"use strict"

window.addEventListener 'load', ->
  FastClick.attach document.body
,false

main = angular.module('RPS',[])

main.service 'sharedData', ->
  this.name = ->
    return 'name'
  this.choice = ->
    return 'choice'
  this.view = 'partials/about.html'

main.controller 'Partials', ($scope, sharedData) ->
  $scope.data = sharedData

main.controller 'AskName', ($scope, sharedData) ->
  $scope.message = 'Hello, what is your name?'
  $scope.name = 'Player'
  $scope.submit = ->
    sharedData.name = $scope.name if $scope.name?
    sharedData.view = 'partials/choice.html' if $scope.name?

main.controller 'ChooseRPS', ($scope, sharedData) ->
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
    sharedData.view = 'partials/end.html'

main.controller 'Final', ($scope, sharedData, $http) ->
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
#  $http.get('/api/players')
#  .success (data) ->
#    console.log 'Data: ' + data
#  .error (err) ->
#    console.log 'Error: ' + err
  $http.post('/api/players', {name: sharedData.name})
    .success (data) ->
      console.log data
    .error (err) ->
      console.log err
  $scope.click = ->
    sharedData.view = 'partials/choice.html'

main.controller 'about', ($scope, sharedData) ->
  $scope.click = ->
    sharedData.view = 'partials/play.html'