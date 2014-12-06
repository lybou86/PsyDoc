(function ($) {
    var $header = $('header'), 
        $sidebar = $("#sidebar"), 
        $pageContent = $("#page-content"); 

    // Ajout de la transparence à l'en-tête lors d'un scroll 
    $(window).on("scroll", function () {
        if ($(this).scrollTop() > 50) $header.addClass("navbar-glass");
        else $header.removeClass("navbar-glass");
    });

    // S'assure que le contenu ait une taille approprié lors de redimensionnement
    $(window).on("resize orientationchange", function () {
        var windowHeight = $(window).height(),
              headerHeight = $header.outerHeight(),
              sidebarHeight = $sidebar.outerHeight();

        if ($header.hasClass("navbar-fixed-top") || $header.hasClass("navbar-fixed-bottom")) {
            $pageContent.css("min-height", windowHeight);
        } else if (sidebarHeight > windowHeight) {
            $pageContent.css("min-height", sidebarHeight - headerHeight);
        } else {
            $pageContent.css("min-height", windowHeight - headerHeight);
        }

    }).trigger('resize');

    $(function() {
        $('#page-wrapper').removeClass('loading');
    });

})(window.jQuery);
