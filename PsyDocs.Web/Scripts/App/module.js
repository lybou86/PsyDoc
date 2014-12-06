(function (ng) {
    // Définition du module d'infrastructure
    var module = ng.module('psydocs', ['ui.router', 'psydocs.directives', 'psydocs.api']);

    function configuration($locationProvider) {
        // Les routes auront des liens normaux (/module/page) et non des URLs en hashbang (#/module/page, !/module/page)
        $locationProvider.html5Mode(true);
    }

    configuration.$inject = ['$locationProvider'];

    module.config(configuration);

    function run($rootScope) {
        $rootScope.stateChanging = false;
        $rootScope.pageLoading = false;

        $rootScope.$on('$stateChangeStart', function() {
            $rootScope.stateChanging = true;
        });

        $rootScope.$on('$stateChangeSuccess', function() {
            $rootScope.stateChanging = false;
        });

        $rootScope.$on('$stateChangeError', function() {
            // TODO: Faire quelque chose de significatif avec l'erreur (redirection / affichage de message d'erreur)
            $rootScope.stateChanging = false;
        });

        $rootScope.$on('$stateNotFound', function () {
            // TODO: Faire quelque chose de significatif avec l'erreur (redirection / affichage de message d'erreur)
            $rootScope.stateChanging = false;
        });
    }

    run.$inject = ['$rootScope'];

    module.run(run);

})(window.angular);