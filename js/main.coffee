main = angular.module('RPS',['ui.bootstrap'])

main.config ($routeProvider) ->
  $routeProvider
    .when('/page/:slug', {templateUrl: 'partials/page.html', controller: 'RouteController'})
    .otherwise {redirectTo: 'page/name'}

angular.module('RPS').controller 'RouteController', ($scope, $rootScope, $routeParams) ->
  slug = $routeParams.slug
  $scope.page = $rootScope.pages[slug]

angular.module('RPS').controller 'AppController', ($scope, $rootScope) ->
  $rootScope.pages =
    "name": "part where player name entered"
    "contact": "This is the contact page."

angular.module('RPS').controller 'choices', ($scope) ->
  $scope.images =
    'rock':
      image: 'static/rock.svg'
    'paper':
      image: 'static/paper.svg'
    'scissors': 
      image: 'static/scissors.svg'

angular.module('RPS').controller 'AskPlayer', ($scope) ->
  $scope.question = 'Hello, what is your name?'
  $scope.name = 'Player'
  $scope.submit = ->
    alert 'this is the part where I change the view...'
