(function(ng) {

    var module = ng.module('psydocs');

    function controller($scope, service, dependencies) {
        ng.extend($scope, dependencies);
        };

    controller.$inject = ['$scope', 'psydocs.api.service', 'dependencies'];

    function configuration($stateProvider) {
        $stateProvider.state('dossiers.recherche', {
            url: '/recherche',
            controller: controller,
            templateUrl: '/templates/dossiers/recherche',
            resolve: {
            dependencies: ['$q', 'psydocs.api.service', function ($q, service) {
                return $q.all({
                    dossiers: service.dossiers.getDossiers()
                });
            }]
        }

        });
    }

    configuration.$inject = ['$stateProvider'];

    module.config(configuration);

})(window.angular);