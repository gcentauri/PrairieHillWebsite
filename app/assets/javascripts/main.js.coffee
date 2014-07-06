# This line is related to our Angular app, not to our
# HomeCtrl specifically. This is basically how we tell
# Angular about the existence of our application.
@phill = angular.module('phill', [])

# This routing directive tells Angular about the default
# route for our application. The term "otherwise" here
# might seem somewhat awkward, but it will make more
# sense as we add more routes to our application.
@phill.config(['$routeProvider', ($routeProvider) ->
  $routeProvider.
    when('/test', {
      templateUrl: '../templates/shifts/index.html',
      controller: 'ShiftIndexCtrl'
    }).
    when('/test/:id', {
      templateUrl: '../templates/shifts/show.html',
      controller: 'ShiftShowCtrl'
    }).        
    otherwise({
      templateUrl: '../templates/home.html',
      controller: 'HomeCtrl'
    }) 
])
