@phill.controller 'ShiftShowCtrl', ['$scope', '$http', '$routeParams', ($scope, $http, $routeParams) ->
  $http.get("./test/#{$routeParams.id}.json").success((data) ->
    $scope.shift = data
  )
]
