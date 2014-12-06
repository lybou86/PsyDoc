(function(ng, undefined) {
    var module = ng.module('psydocs.directives');

    function validationMessageDirective() {
        return {
            restrict: 'E',
            templateUrl: '/templates/directives/validation-message',
            require: '^form',
            replace: true,
            transclude: true,
            scope: {
                validator: '@',
                'for': '@',
                submitted: '='
            },
            link: function (scope, elem, attrs, formCtrl) {

                var formGroupClass = function() {
                    var formElement = formCtrl[scope.for],
                        isInvalid = formElement.$invalid;

                    if (scope.submitted !== false) {
                        if (isInvalid) return 'has-error';
                        else if (formElement.$dirty) return 'has-success';
                    }

                    return '';
                }
                
                scope.isVisible = function () {
                    var formElement = formCtrl[scope.for];
                    
                    return formElement && (scope.submitted === true || formElement.$dirty) && formElement.$error[scope.validator] === true;
                };

                scope.$watch(formGroupClass, function (cssClass) {
                    // Si il y a une erreur de validation sur l'élément attaché, nous ajoutons une classe CSS au plus proche parent de classe form-group
                    var formGroup = elem.closest('.form-group');

                    formGroup.removeClass('has-error has-success').addClass(cssClass);
                    
                });


            }
        }
    }

    validationMessageDirective.$inject = [];

    module.directive('validationMessage', validationMessageDirective);
})(window.angular);