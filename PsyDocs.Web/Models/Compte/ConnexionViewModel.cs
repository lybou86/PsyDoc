using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PsyDocs.Web.Models.Compte
{
    public class ConnexionViewModel
    {
        public string Courriel { get; set; }
        public string MotDePasse { get; set; }
        public string ReturnUrl { get; set; }
    }
}