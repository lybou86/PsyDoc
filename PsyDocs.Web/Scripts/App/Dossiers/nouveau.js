(function(ng) {

    var module = ng.module('psydocs');

    function controller($scope, service, dependencies) {
        ng.extend($scope, dependencies);

        $scope.dossier = {
            numero: null,
            modaliteId: null,
            nomTherapie: null,
            descriptionTherapie: null,
            clients: []
        };


        var activeClientIndex = -1;


        $scope.clientConfirmed = false;
        $scope.selectedClient = null;
        $scope.isClientActive = function(index) {
            return activeClientIndex === index;
        }

        $scope.clientValid = function () {
            return $scope.nouveau && $scope.nouveau.client && $scope.nouveau.client.$valid;
        };

        $scope.addClient = function () {
            if (!$scope.clientValid() && $scope.dossier.clients.length) {
                $scope.clientConfirmed = true;
                return;
            }

            var nouveauClient = {
                nom: null,
                prenom: null,
                numeroTelephone: null,
                sexe: null,
                courriel: null,
                dateNaissance: null,
                reference: null,
                nomAssureur: null,
                numeroTelephoneAssureur: null,
                adresseCivique: null,
                codePostal: null,
                province: null,
                pays: null,
                ville: null
            };

            // Réutilise l'adresse civique du dernier client sélectionné. Utile pour couple / famille
            if ($scope.selectedClient !== null) {
                nouveauClient.adresseCivique = $scope.selectedClient.adresseCivique;
                nouveauClient.codePostal = $scope.selectedClient.codePostal;
                nouveauClient.province = $scope.selectedClient.province;
                nouveauClient.pays = $scope.selectedClient.pays;
                nouveauClient.ville = $scope.selectedClient.ville;
            }


            $scope.dossier.clients.push(nouveauClient);

            changeClient($scope.dossier.clients.length - 1);
        };

        $scope.removeClient = function (i) {
            if (!ng.isNumber(i)) i = activeClientIndex;
            
            if (i >= 0 && i < $scope.dossier.clients.length) {
                $scope.dossier.clients.splice(i, 1);

                changeClient(Math.min(i, $scope.dossier.clients.length - 1));
            }
        };

        $scope.nomClient = function(client) {
            if (client.nom || client.prenom) return (client.prenom || '') + ' ' + (client.nom || '');

            return '(Nouveau Client)';
        };

        var changeClient = function(i) {
            if (i >= 0 && i < $scope.dossier.clients.length) {
                activeClientIndex = i;
                $scope.selectedClient = $scope.dossier.clients[i];
                $scope.clientConfirmed = false;
                if ($scope.nouveau && $scope.nouveau.client) {
                    $scope.nouveau.client.$setPristine();

                }
            }
        };

        $scope.selectClient = function (i) {
            if (!$scope.clientValid() && $scope.dossier.clients.length) {
                $scope.clientConfirmed = true;
                return;
            }

            changeClient(i);
        };

        $scope.hasSelectedClient = function () {
            return $scope.selectedClient !== null;
        }

        $scope.submitted = false;
        $scope.create = function () {

            $scope.submitted = true;
            $scope.clientConfirmed = true;
            if ($scope.nouveau && $scope.nouveau.$valid) {
                console.log($scope.dossier);
            }
        };

        $scope.addClient();
    }

    controller.$inject = ['$scope', 'psydocs.api.service', 'dependencies'];

    function configuration($stateProvider) {
        $stateProvider.state('dossiers.nouveau', {
            url: '/nouveau',
            controller: controller,
            templateUrl: '/templates/dossiers/nouveau',
            resolve: {
                dependencies: ['$q', 'psydocs.api.service', function ($q, service) {
                    return $q.all({
                        modalites: service.modalites.getModalites()
                    });
                }]
            }
        });
    }

    configuration.$inject = ['$stateProvider'];

    module.config(configuration);

})(window.angular);