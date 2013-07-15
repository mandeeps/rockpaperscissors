function MainController($scope) {
  $scope.name = 'Player';
  $scope.submit = function() {
    $('#greeting').css('visibility', 'visible');
  }

  
}
