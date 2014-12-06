(function($) {

    $("#form-login").validate({
        errorClass: "help-block animation-slideUp",
        errorElement: "div",
        errorPlacement: function(error, element) {
            element.parents(".form-group > div").append(error);
        },
        highlight: function(element) {
            $(element).closest(".form-group").removeClass("has-success has-error").addClass("has-error");
            $(element).closest(".help-block").remove();
        },
        success: function(element) {
            element.closest(".form-group").removeClass("has-success has-error"), element.closest(".help-block").remove();
        },
        rules: {
            "Courriel": {
                required: true,
                email: true
            },
            "MotDePasse": {
                required: true
            }
        },
        messages: {
            "Courriel": "Veuillez entrez votre adresse courriel valide",
            "MotDePasse": "Veuillez entrez votre mot de passe"
        }
    });

})(window.jQuery);