angular.factory 'socket', ($rootScope) ->
  socket = io.connect()
    on: (eventName, callback) ->
      socket.on eventName, ->
        args = arguments_
        $rootScope.$apply ->
          callback.apply socket, args

    emit: (eventName, data, callback) ->
      socket.emit eventName, data, ->
        args = arguments_
        $rootScope.$apply ->
          callback.apply socket, args if callback
