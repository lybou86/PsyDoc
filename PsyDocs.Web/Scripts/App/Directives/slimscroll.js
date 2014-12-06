(function(ng) {
    var module = ng.module('psydocs.directives');

    

    function slimscrollDirective(defaults) {
        var options = {};
        if (defaults) ng.extend(options, defaults);

        return {
            restrict: 'A',
            link: function(scope, elem, attrs) {
                scope.$watch(attrs.slimscroll, function(option) {
                    elem.slimScroll(ng.extend({}, options, option));
                });
            }
        };
    }

    slimscrollDirective.$inject = ['slimscrollDefaults'];

    module.value('slimscrollDefaults', {});
    module.directive('slimscroll', slimscrollDirective);
})(window.angular);