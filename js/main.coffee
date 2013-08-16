main = angular.module('RPS',['ui.bootstrap']).
  config ($routeProvider) ->
    $routeProvider
#      .when('/page/:slug', {templateUrl: 'partials/page.html', controller: 'RouteController'})
      .when('/name', {templateUrl: 'partials/name.html', controller: 'AskName'})
      .when('/choice', {templateUrl: 'partials/choice.html', controller: 'ChooseRPS'})
      .otherwise {redirectTo: '/name'}

#angular.module('RPS').controller 'RouteController', ($scope, $rootScope, $routeParams) ->
#  slug = $routeParams.slug
#  $scope.page = $rootScope.pages[slug]

#angular.module('RPS').controller 'AppController', ($scope, $rootScope) ->
#  $rootScope.pages =
#    "name": "part where player name entered"
#    "contact": "This is the contact page."

angular.module('RPS').controller 'ChooseRPS', ($scope) ->
  $scope.images =
    'rock':
      image: 'static/rock.svg'
    'paper':
      image: 'static/paper.svg'
    'scissors': 
      image: 'static/scissors.svg'

angular.module('RPS').controller 'AskName', ($scope) ->
  $scope.question = 'Hello, what is your name?'
  $scope.name = 'Player'
  $scope.submit = ->
    alert 'this is the part where I change the view...'
