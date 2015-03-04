(function (angular) {
  'use strict';

  angular
      .module('application')
      .factory('Me', Me)
      .factory('Session', Session)
      .factory('authInterceptor', authInterceptor);

  function Me($http) {
    return {
      index: function () {
        return $http({
          url: '/api/me',
          method: 'GET'
        })
      }
    }
  }

  function Session($http, $location) {
    return {
      login: function (user) {
        return $http({
          url: '/api/sessions/login',
          method: 'POST',
          data: user
        })
      },

      logout: function () {
        return $http({
          url: '/api/sessions/logout',
          method: 'GET'
        });
      }
    }
  }

  function authInterceptor($q, $location) {
    return {
      'responseError': function (rejection) {
        if (rejection.status >= 400 && $location.path() != '/users/login') {
          $location.path('/users/login')
        }
        return $q.reject(rejection);
      }
    }
  }

})(window.angular);

