main = angular.module('RPS',[])

socket = io.connect 'http://localhost'
socket.on('connect', (data) -> 
  console.log data
  socket.emit 'testing' )

angular.module('RPS').controller 'AskForName', ($scope, $http) ->
  $scope.name = "Player"
  $scope.submit = ->
    $scope.greeting = "Hello #{$scope.name}! Let's play Rock Paper Scissors..."
    #$http.put($scope.name).success (data) ->
      

angular.module('RPS').controller 'ChooseRPS', ($scope) ->
  $scope.choice = ""
