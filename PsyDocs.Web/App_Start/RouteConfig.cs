using System.Web.Mvc;
using System.Web.Routing;

namespace PsyDocs.Web
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");
            routes.MapMvcAttributeRoutes();

            routes.MapRoute("AngularTemplate", "templates/{*path}", new{controller = "Templates", action = "Render"});
            routes.MapRoute("AngularDossiers", "dossiers/{*path}", new {controller = "Dossiers", action = "Index"});

            // Cette route doit être défini en dernier puisqu'elle catch absolument tout
            routes.MapRoute("AngularHome", "{*path}", new {controller = "Home", action = "Index"});
        }
    }
}
