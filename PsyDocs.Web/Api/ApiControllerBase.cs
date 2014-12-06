using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http;

namespace PsyDocs.Web.Api
{
    [Authorize]
    public abstract class ApiControllerBase : ApiController
    {


    }
}