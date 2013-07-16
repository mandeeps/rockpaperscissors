main = angular.module('RPS',[])

angular.module('RPS').controller 'AskForName', ($scope) ->
  $scope.name = "Player"
  $scope.submit = ->
    alert('submitted!')
    $scope.greeting = "Hello #{$scope.name}! Let's play Rock Paper Scissors..."

angular.module('RPS').controller 'ChooseRPS', ($scope) ->
  $scope.choice = ""
