using System.Web.Optimization;

namespace PsyDocs.Web
{
    public class BundleConfig
    {
        public static void RegisterBundles(BundleCollection bundles)
        {
            // Scripts bundles
            // Les librairies externes
            bundles.Add(new ScriptBundle("~/bundles/vendors/modernizr").Include("~/scripts/vendors/modernizr-{version}.js"));

            bundles.Add(new ScriptBundle("~/bundles/vendors").Include("~/scripts/vendors/jquery-{version}.js")
                                                             .Include("~/scripts/vendors/jquery-ui-{version}.js")
                                                             .Include("~/scripts/vendors/bootstrap-{version}.js")
                                                             .Include("~/scripts/vendors/moment-{version}.js")
                                                             .IncludeDirectory("~/scripts/vendors/plugins", "*.js", false));

            bundles.Add(new ScriptBundle("~/bundles/vendors/angular").Include("~/scripts/vendors/angular-{version}.js",
                                                                              "~/scripts/vendors/angular-ui-router-{version}.js"));

            // Les scripts de l'application
            // La page de connexion
            bundles.Add(new ScriptBundle("~/bundles/login").Include("~/scripts/login.js"));

            // L'application
            bundles.Add(new ScriptBundle("~/bundles/app").Include("~/scripts/layout.js")
                                                         .Include("~/scripts/app/module.js")
                                                         .Include("~/scripts/app/directives-module.js")
                                                         .IncludeDirectory("~/scripts/app/directives", "*.js")
                                                         .Include("~/scripts/app/api-module.js")
                                                         .IncludeDirectory("~/scripts/app/api", "*.js"));

            // Le module des dossiers
            bundles.Add(new ScriptBundle("~/bundles/app/dossiers").Include("~/scripts/app/dossiers-module.js")
                                                                  .IncludeDirectory("~/scripts/app/dossiers", "*.js"));

            // Le module d'accueil (home)
            bundles.Add(new ScriptBundle("~/bundles/app/home").Include("~/scripts/app/home-module.js")
                                                                  .IncludeDirectory("~/scripts/app/home", "*.js"));

            // Styles bundles
            bundles.Add(new StyleBundle("~/content/vendors").Include("~/content/bootstrap-{version}.css")
                                                            .Include("~/content/icheck-square.css")
                                                            .Include("~/content/plugins.css"));

            bundles.Add(new StyleBundle("~/content/app").Include("~/content/app.css"));

        }
    }
}
