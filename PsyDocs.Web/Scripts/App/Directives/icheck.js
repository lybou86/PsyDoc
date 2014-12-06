(function(ng) {
    var module = ng.module('psydocs.directives');

    function icheckDirective($timeout, $parse) {
        return {
            restrict: 'A',
            require: '?ngModel',
            link: function ($scope, element, $attrs) {
                var value = $attrs['value'],
                    ngModelGetter = $parse($attrs['ngModel']);

                return $timeout(function () {

                    $scope.$watch($attrs.ngModel, function (newValue) {
                        $(element).iCheck('update');
                    });

                    $(element).iCheck({
                        checkboxClass: 'icheckbox_square-blue',
                        radioClass: 'iradio_square-blue'
                    }).on('ifChanged', function (event) {

                        var elemType = $(element).attr('type');

                        if (elemType === 'checkbox' && $attrs.ngModel) {
                            $scope.$apply(function () {
                                return ngModelGetter.assign($scope, event.target.checked);
                            });
                        }
                        else if (elemType === 'radio' && $attrs.ngModel) {
                            return $scope.$apply(function () {
                                return ngModelGetter.assign($scope, value);
                            });
                        }
                    });

                });
            }
        };
    }

    icheckDirective.$inject = ['$timeout', '$parse'];

    module.directive('icheck', icheckDirective);
})(window.angular);