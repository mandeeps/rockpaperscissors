main = angular.module('RPS',[])

angular.module('RPS').controller 'AskPlayer', ($scope) ->
  $scope.question = "Hello, what is your name?"
  $scope.name = "Player"
  $scope.submit = ->
    $scope.response = "Hello #{$scope.name}! Let's play Rock Paper Scissors..."

angular.module('RPS').controller 'ChooseRPS', ($scope) ->
  $scope.choice = ""
