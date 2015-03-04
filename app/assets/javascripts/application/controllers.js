(function (angular) {
  'use strict';

  angular
      .module('application')
      .controller('LoginCtrl', LoginCtrl)
      .controller('RegisterCtrl', RegisterCtrl)
      .controller('MeCtrl', MeCtrl);

  function LoginCtrl($scope, $location, Session) {
    $scope.login = function () {
      Session.login($scope.user).then(function (success) {
        console.log(success);
        $location.path('/')
      });
    };
  }

  function RegisterCtrl($scope, $http, $location) {
    $scope.register = function () {
      $http({
        url: '/api/users',
        method: 'POST',
        data: {user: $scope.user}
      }).then(function (success) {
        console.log(success);
        $location.path('/users/login')
      });
    };
  }

  function MeCtrl($scope, Me) {
    Me.index().then(function (success) {
      $scope.me = success.data;
    })
  }

})(window.angular);