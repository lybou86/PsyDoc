(function(ng) {
    var module = ng.module('psydocs.directives');

    function placeholderDirective() {
        return {
            restrict: 'A',
            link: function(scope, elem) {
                elem.placeholder();
            }
        };
    }

    placeholderDirective.$inject = [];

    module.directive('placeholder', placeholderDirective);
})(window.angular);