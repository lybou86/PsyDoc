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
    
    public partial class Therapie
    {
        public Therapie()
        {
            this.Seances = new HashSet<Seance>();
        }
    
        public System.Guid Id { get; set; }
        public System.Guid DossierId { get; set; }
        public string Nom { get; set; }
        public string Description { get; set; }
    
        public virtual Dossier Dossier { get; set; }
        public virtual ICollection<Seance> Seances { get; set; }
    }
}
