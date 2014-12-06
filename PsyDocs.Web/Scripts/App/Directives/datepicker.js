(function(ng) {
    var module = ng.module('psydocs.directives');

    $.fn.datepicker.defaults.format = "dd/mm/yyyy";
    $.fn.datepicker.defaults.language = "fr";


    $.fn.datepicker.dates['fr'] = {
        days: ["Dimanche", "Lundi", "Mardi", "Mercredi", "Jeudi", "Vendredi", "Samedi", "Dimanche"],
        daysShort: ["Dim", "Lun", "Mar", "Mer", "Jeu", "Ven", "Sam", "Dim"],
        daysMin: ["D", "L", "Ma", "Me", "J", "V", "S", "D"],
        months: ["Janvier", "Février", "Mars", "Avril", "Mai", "Juin", "Juillet", "Août", "Septembre", "Octobre", "Novembre", "Décembre"],
        monthsShort: ["Jan", "Fév", "Mar", "Avr", "Mai", "Jui", "Jul", "Aou", "Sep", "Oct", "Nov", "Déc"],
        today: "Aujourd'hui",
        clear: "Effacer",
        weekStart: 1,
        format: "dd/mm/yyyy"
    };

    function datepickerDirective() {
        return {
            restrict: 'A',
            require: '?ngModel',
            link: function(scope, elem, attrs, ngModelCtrl) {
                elem.datepicker();
            }
        }
    }

    datepickerDirective.$inject = [];

    module.directive('datepicker', datepickerDirective);

})(window.angular);