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
    [RoutePrefix("api/dossiers")]
    public class DossiersController : ApiControllerBase
    {
        [HttpGet, Route("")]
        public async Task<IHttpActionResult> GetDossiers()
        {
            using (var context = new PsyDocsContext())
            {
                var dossiers = await context.Dossiers.Select(m => new {m.Id, m.Numero, m.Ouverture, m.Fermeture}).ToListAsync();

                return Ok(dossiers);
            }
        }
    }
}
