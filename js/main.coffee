main = angular.module('RPS',[])

main.config ($routeProvider) ->
  $routeProvider
    .when('/page/:slug', {templateUrl: 'partials/name.html', controller: 'RouteController'})
    .otherwise {redirectTo: '/page/home'}

angular.module('RPS').controller 'RouteController', ($scope, $rootScope, $routeParams) ->
  slug = $routeParams.slug
  $scope.page = $rootScope.pages[slug]

angular.module('RPS').controller 'AppController', ($scope, $rootScope) ->
  $rootScope.pages =
    "home": "This is the home page. Welcome"
    "name": "partials/name.html"
    "contact": "This is the contact page. Welcome"

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

