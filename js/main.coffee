main = angular.module('RPS',[])

main.config ($routeProvider) ->
  $routeProvider
    .when('/page/:slug', {templateUrl: 'partials/page.html', controller: 'RouteController'})
    .otherwise {redirectTo: '/page/home'}

angular.module('RPS').controller 'RouteController', ($scope, $routeParams) ->
  slug = $routeParams.slug

angular.module('RPS').controller 'choices', ($scope) ->
  $scope.images = [
    {'image': 'static/rock.svg'},
    {'image': 'static/paper.svg'},
    {'image': 'static/scissors.svg'},
  ]

angular.module('RPS').controller 'AskPlayer', ($scope) ->
  $scope.question = 'Hello, what is your name?'
  $scope.name = 'Player'
  $scope.submit = ->
    $scope.response = "Hello #{$scope.name}! Let's play Rock Paper Scissors..."

angular.module('RPS').controller 'ChooseRPS', ($scope) ->
  $scope.choice = ''
