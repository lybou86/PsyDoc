(function (ng) {
    var module = ng.module('psydocs');

    function configuration($urlRouterProvider, $stateProvider) {

        // Si aucune route ne match avec l'url, nous redirigeons vers la page de recherche
        $urlRouterProvider.otherwise('/dashboard');

        $stateProvider.state('home', {
            'abstract': true,
            template: '<ui-view/>'
        });
    }

    configuration.$inject = ['$urlRouterProvider', '$stateProvider'];

    module.config(configuration);
})(window.angular);