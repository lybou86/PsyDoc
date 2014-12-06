(function(ng) {
    var module = ng.module('psydocs.directives');

    function tooltipDirective() {
        return {
            restrict: 'A',
            link: function (scope, elem, attrs) {
                elem.tooltip({
                    title: attrs.tooltip,
                    placement: attrs.tooltipPlacement
                });
            }
        };
    }

    tooltipDirective.$inject = [];

    module.directive('tooltip', tooltipDirective);
})(window.angular);