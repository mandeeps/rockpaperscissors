main = angular.module('RPS',['ui.bootstrap']).
  config ($routeProvider, $locationProvider) ->
#    $locationProvider.html5Mode true;
    $routeProvider
#      .when('/page/:slug', {templateUrl: 'partials/page.html', controller: 'RouteController'})
      .when('/play', {templateUrl: 'partials/play.html', controller: 'AskName'})
      .when('/choice', {templateUrl: 'partials/choice.html', controller: 'ChooseRPS'})
      .when('/about', {templateUrl: 'partials/about.html', controller: 'about'})
      .when('/howto', {templateUrl: 'partials/howto.html', controller: 'howto'})
      .otherwise {redirectTo: '/about'}
    

#angular.module('RPS').controller 'RouteController', ($scope, $rootScope, $routeParams) ->
#  slug = $routeParams.slug
#  $scope.page = $rootScope.pages[slug]

#angular.module('RPS').controller 'AppController', ($scope, $rootScope) ->
#  $rootScope.pages =
#    "name": "part where player name entered"
#    "contact": "This is the contact page."

angular.module('RPS').controller 'ChooseRPS', ($scope, $rootScope) ->
  $scope.message = "OK " + $rootScope.name + "! Choose Rock, Paper or Scissors!"
  $scope.images =
    'rock':
      image: 'static/rock.svg'
    'paper':
      image: 'static/paper.svg'
    'scissors': 
      image: 'static/scissors.svg'

angular.module('RPS').controller 'AskName', ($scope, $rootScope, $location) ->
  $scope.message = 'Hello, what is your name?'
  $scope.name = 'Player'
  $scope.submit = ->
    $rootScope.name = $scope.name
    $location.path('choice');

angular.module('RPS').controller 'about', () ->

angular.module('RPS').controller 'howto', () ->

