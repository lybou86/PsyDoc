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
    
    public abstract partial class Document
    {
        public Document()
        {
            this.Sections = new HashSet<Section>();
        }
    
        public System.Guid Id { get; set; }
        public string Titre { get; set; }
        public string Description { get; set; }
    
        public virtual ICollection<Section> Sections { get; set; }
    }
}
