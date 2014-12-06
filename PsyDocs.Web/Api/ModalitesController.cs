using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.Http;
using PsyDocs.Data;

namespace PsyDocs.Web.Api
{
    [RoutePrefix("api/modalites")]
    public class ModalitesController : ApiControllerBase
    {
        [HttpGet, Route("")]
        public async Task<IHttpActionResult> GetModalites()
        {
            using (var context = new PsyDocsContext())
            {
                var modalites = await context.ModaliteTraitements
                                             .Select(m => new {m.Id, m.Nom})
                                             .ToListAsync();

                return Ok(modalites);
            }
        }

    }
}