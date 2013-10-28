"use strict"
main = angular.module('RPS',[]). #'ui.bootstrap'
  config ($routeProvider) ->
    $routeProvider
#      .when('/page/:slug', {templateUrl: 'partials/page.html', controller: 'RouteController'})
      .when('/play', {templateUrl: 'partials/play.html', controller: 'AskName'})
      .when('/choice', {templateUrl: 'partials/choice.html', controller: 'ChooseRPS'})
      .when('/end', {templateUrl: 'partials/end.html', controller: 'Final'})
      .when('/about', {templateUrl: 'partials/about.html', controller: 'about'})
      .when('/howto', {templateUrl: 'partials/howto.html', controller: 'howto'})
      .otherwise {redirectTo: '/about'}

### main.config(['$locationProvider', ($location) -> 
  $location.html5Mode true
])
###

#angular.module('RPS').controller 'RouteController', ($scope, $rootScope, $routeParams) ->
#  slug = $routeParams.slug
#  $scope.page = $rootScope.pages[slug]

#angular.module('RPS').controller 'AppController', ($scope, $rootScope) ->
#  $rootScope.pages =
#    "name": "part where player name entered"
#    "contact": "This is the contact page."

angular.module('RPS').controller 'AskName', ($scope, $rootScope, $location) ->
  $scope.message = 'Hello, what is your name?'
  $scope.name = 'Player'
  $scope.submit = ->
    $rootScope.name = $scope.name
    $location.path 'choice'

angular.module('RPS').controller 'ChooseRPS', ($scope, $rootScope, $location) ->
  $scope.message = "OK " + $rootScope.name + "! \n Choose Rock, Paper or Scissors!"
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
    $rootScope.choice = choice
    $location.path 'end'

angular.module('RPS').controller 'Final', ($scope, $rootScope) ->
  select = ['rock', 'paper', 'scissors']
  rand = Math.floor(Math.random() * select.length)
  $scope.comp = select[rand]
  if $rootScope.choice is $scope.comp then result = 'tie'
  if $rootScope.choice is 'rock' and $scope.comp is 'paper' then result = 'lose'
  if $rootScope.choice is 'rock' and $scope.comp is 'scissors' then result = 'win'
  if $rootScope.choice is 'paper' and $scope.comp is 'rock' then result = 'win'
  if $rootScope.choice is 'paper' and $scope.comp is 'scissors' then result = 'lose'
  if $rootScope.choice is 'scissors' and $scope.comp is 'rock' then result = 'lose'
  if $rootScope.choice is 'scissors' and $scope.comp is 'paper' then result = 'win'
  #$scope.condition = result
  $scope.message = $rootScope.name + ', you ' + result + '!'

angular.module('RPS').controller 'about', () ->

angular.module('RPS').controller 'howto', () ->