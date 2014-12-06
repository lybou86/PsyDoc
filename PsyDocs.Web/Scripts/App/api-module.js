(function (ng) {
    // Définition du module d'api
    var module = ng.module('psydocs.api', []),
        apiEndpoint = '/api';

    function returnsData(httpResult) {
        return httpResult.data;
    }
    
    function apiClientService($http) {

        function client(config) {
            config.url = apiEndpoint + config.url;
            return $http(config).then(returnsData);
        }

        client.get = function(path, config) {
            return $http.get(apiEndpoint + path, config).then(returnsData);
        };

        client.delete = function(path, config) {
            return $http['delete'](apiEndpoint + path, config).then(returnsData);
        };

        client.head = function(path, config) {
            return $http.head(apiEndpoint + path, config).then(returnsData);
        };

        client.post = function(path, data, config) {
            return $http.post(apiEndpoint + path, data, config).then(returnsData);
        };

        return client;
    }

    
    function apiServiceProvider() {
        var registered = {},
            service = null;

        this.register = function (name, serviceFn) {
            if(ng.isFunction(serviceFn))
                registered[name] = serviceFn;
        };

        this.$get = ['$injector', '$http', function($injector, $http) {
            if (service === null) {
                service = {};
                ng.forEach(registered, function (serviceFn, name) {
                    service[name] = $injector.instantiate(serviceFn, { '$http': apiClientService($http) });
                });
            }

            return service;
        }];
    }

    apiServiceProvider.$inject = [];

    module.provider('psydocs.api.service', apiServiceProvider);
})(window.angular);