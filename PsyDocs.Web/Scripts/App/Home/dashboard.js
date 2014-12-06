(function(ng) {

    var module = ng.module('psydocs');

    function controller($scope) {
        
    }

    controller.$inject = ['$scope'];

    function configuration($stateProvider) {
        $stateProvider.state('home.dashboard', {
            url: '/dashboard',
            controller: controller,
            templateUrl: '/templates/home/dashboard'
        });
    }

    configuration.$inject = ['$stateProvider'];

    module.config(configuration);

})(window.angular);