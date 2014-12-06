(function (ng) {

    var module = ng.module('psydocs.api');


    function dossierService($http) {
        this.getDossiers = function () {
            return $http.get('/dossiers');
        };
    }

    dossierService.$inject = ['$http'];

    function config(serviceProvider) {
        serviceProvider.register('dossiers', dossierService);
    }

    config.$inject = ['psydocs.api.serviceProvider'];

    module.config(config);

})(window.angular);