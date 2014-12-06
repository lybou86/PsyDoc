using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;

namespace PsyDocs.Web.Controllers
{
    public class HomeController : MvcControllerBase
    {
        public ActionResult Index()
        {
            return View();
        }
    }
}
