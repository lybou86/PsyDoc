//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace PsyDocs.Data
{
    using System;
    using System.Collections.Generic;
    
    public partial class ModaliteTraitement
    {
        public ModaliteTraitement()
        {
            this.Dossiers = new HashSet<Dossier>();
        }
    
        public System.Guid Id { get; set; }
        public string Nom { get; set; }
    
        public virtual ICollection<Dossier> Dossiers { get; set; }
    }
}
