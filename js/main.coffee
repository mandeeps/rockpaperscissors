main = angular.module('RPS',[])

main.config ($routeProvider) ->
  $routeProvider
    .when('/page/:slug', {templateUrl: 'partials/page.html', controller: 'RouteController'})
    .otherwise {redirectTo: 'page/home'}

angular.module('RPS').controller 'RouteController', ($scope, $rootScope, $routeParams) ->
  slug = $routeParams.slug
  $scope.page = $rootScope.pages[slug]

angular.module('RPS').controller 'AppController', ($scope, $rootScope) ->
  $rootScope.pages =
    "home": "This is the home page."
    "name": "this will be the part where you enter your name..."
    "contact": "This is the contact page."

angular.module('RPS').controller 'choices', ($scope) ->
  $scope.images =
    'image': 'static/rock.svg'
    'image': 'static/paper.svg'
    'image': 'static/scissors.svg'

angular.module('RPS').controller 'AskPlayer', ($scope) ->
  $scope.question = 'Hello, what is your name?'
  $scope.name = 'Player'
  $scope.submit = ->
    alert 'this is the part where I change the view...'

