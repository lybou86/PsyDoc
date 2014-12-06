using System.Linq;
using System.Security.Claims;
using System.Web;
using System.Web.Mvc;
using Microsoft.AspNet.Identity;
using Microsoft.Owin.Security;
using PsyDocs.Data;
using PsyDocs.Web.Models.Compte;

namespace PsyDocs.Web.Controllers
{
    [RoutePrefix("compte")]
    public class CompteController : MvcControllerBase
    {

        // GET: /Account/Login
        [AllowAnonymous]
        [HttpGet, Route("connexion")]
        public ActionResult Connexion(string returnUrl)
        {
            return View(new ConnexionViewModel
            {
                ReturnUrl = returnUrl
            });
        }

        [AllowAnonymous]
        [HttpPost, Route("connexion")]
        public ActionResult Connexion(ConnexionViewModel model)
        {
            using (var context = new PsyDocsContext())
            {
                var existingUser = context.Utilisateurs.FirstOrDefault(u => u.Courriel == model.Courriel);
                if (existingUser != null && model.MotDePasse.MD5Hash() == existingUser.MotDePasse)
                {
                    var identity = new ClaimsIdentity(DefaultAuthenticationTypes.ApplicationCookie);

                    identity.AddClaim(new Claim(ClaimTypes.GivenName, existingUser.Prenom));
                    identity.AddClaim(new Claim(ClaimTypes.Name, existingUser.Nom));
                    identity.AddClaim(new Claim(ClaimTypes.HomePhone, existingUser.NumeroTelephone));
                    identity.AddClaim(new Claim(ClaimTypes.NameIdentifier, existingUser.Id.ToString()));
                    identity.AddClaim(new Claim(ClaimTypes.Email, existingUser.Courriel));

                    if(existingUser.EstAdministrateur)
                        identity.AddClaim(new Claim(ClaimTypes.Role, "Administrateur"));

                    AuthenticationManager.SignIn(identity);
                    return RedirectToLocal(model.ReturnUrl);
                }
            }

            // Nom d'utilisateur ou mot de passe incorrecte
            ModelState.AddModelError("", "Courriel ou mot de passe invalide");

            return View(model);
        }

        [HttpPost, Route("deconnexion")]
        public ActionResult Deconnexion()
        {
            AuthenticationManager.SignOut();
            return RedirectToAction("Index", "Home");
        }

        #region Helpers

        private IAuthenticationManager AuthenticationManager
        {
            get
            {
                return HttpContext.GetOwinContext().Authentication;
            }
        }

        private ActionResult RedirectToLocal(string returnUrl)
        {
            if (Url.IsLocalUrl(returnUrl))
            {
                return Redirect(returnUrl);
            }

            return RedirectToAction("Index", "Home");
        }

        #endregion
    }
}
