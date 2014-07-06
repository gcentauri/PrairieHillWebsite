@phill.controller 'ShiftIndexCtrl', ['$scope', '$location', '$http', ($scope, $location, $http) ->
  $scope.shifts = []
  $http.get('./shifts.json').success((data) ->
    $scope.shifts = data
  )

  $scope.viewShift = (id) ->
    $location.url "/test/#{id}"

]
