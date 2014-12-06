(function (ng) {

    var module = ng.module('psydocs.api');


    function modaliteService($http) {
        this.getModalites = function () {
            return $http.get('/modalites');
        };
    }

    modaliteService.$inject = ['$http'];

    function config(serviceProvider) {
        serviceProvider.register('modalites', modaliteService);
    }

    config.$inject = ['psydocs.api.serviceProvider'];

    module.config(config);

})(window.angular);