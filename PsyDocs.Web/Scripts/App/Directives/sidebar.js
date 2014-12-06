(function(ng) {
    var module = ng.module('psydocs.directives');

    function sidebarDirective() {
        return {
            restrict: 'C',
            link: function (scope, elem) {
                elem.on('click', '.sidebar-nav-menu', function (e) {
                    e.preventDefault();
                    $(this).toggleClass('open');
                });

                elem.on('click', '.sidebar-nav-submenu', function (e) {
                    var $this = $(this);

                    e.preventDefault();
                    if ($this.parent().hasClass('active') !== true) {
                        if ($this.hasClass('open')) {
                            $this.removeClass('open');
                        } else {
                            $this.closest("ul").find(".sidebar-nav-submenu.open").removeClass("open");
                            $this.addClass("open");
                        }
                    }
                });
            }
        };
    }

    sidebarDirective.$inject = [];

    module.directive('sidebar', sidebarDirective);
})(window.angular);