(function(ng) {
    var module = ng.module('psydocs.directives');

    function loadingIndicatorDirective() {
        return {
            restrict: 'A',
            link: function (scope, elem, attrs) {
                var $indicator = $('<div class="indicator"><div class="inner"><div class="spinner themed-background"></div></div></div>');

                elem.addClass('loading-indicator').append($indicator);

                scope.$watch(attrs.loadingIndicator, function(isLoading) {
                    if (isLoading) {
                        $indicator.css({ top: attrs.loadingTop || elem.css('padding-top') });
                        elem.addClass('loading');
                    }
                    else elem.removeClass('loading');
                });
            }
        };
    }

    loadingIndicatorDirective.$inject = [];

    module.directive('loadingIndicator', loadingIndicatorDirective);
})(window.angular);