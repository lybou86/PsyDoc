(function(ng) {
    var module = ng.module('psydocs.directives');

    function rippleDirective() {
        return {
            restrict: 'A',
            link: function(scope, element) {
                element.css({
                    overflow: "hidden",
                    position: "relative"
                });
                element.bind("click", function(e) {
                    var i, s, t, l, o = $(this);

                    if (element.children('.btn-ripple').length) {
                        element.children('.btn-ripple').removeClass('animate');
                    } else {
                        element.prepend('<span class="btn-ripple"></span>');
                    }

                    var $ripple = element.children('.btn-ripple');

                    if (!$ripple.height() && !$ripple.width()) {
                        var size = Math.max(element.outerWidth(), element.outerHeight());
                        $ripple.css({ width: size, height: size });
                    }

                    
                    var top = e.pageY - element.offset().top - $ripple.height() / 2,
                        left = e.pageX - element.offset().left - $ripple.width() / 2;

                    $ripple.css({
                        top: top,
                        left: left
                    }).addClass("animate");
                });
            }
        };
    }

    rippleDirective.$inject = [];

    module.directive('ripple', rippleDirective);
})(window.angular);