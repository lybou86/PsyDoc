using System.Web.Mvc;

namespace PsyDocs.Web.Controllers
{
    public class TemplatesController : MvcControllerBase
    {

        public ActionResult Render(string path)
        {
            var viewPath = "~/Views/Templates/" + path + ".cshtml";
            var foundView = ViewEngineCollection.FindPartialView(ControllerContext, viewPath);
            
            if(foundView != null)
                return PartialView("~/Views/Templates/" + path + ".cshtml");

            return HttpNotFound();
        }
    }
}