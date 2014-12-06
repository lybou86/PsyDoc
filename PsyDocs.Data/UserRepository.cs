using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using PsyDocs.Data;

namespace PsyDocs.Data.Persistance
{
    class UserRepository
    {
        private PsyDocsContext context = new PsyDocsContext();
   

    public IQueryable<Utilisateur> Utilisateurs 
    {
        get { return context.Utilisateurs; }
    }


    public Utilisateur getUserbyId(int userId )
    {
        return context.Utilisateurs.Find(userId);
    }

    public void add(Utilisateur utilisateur)
    
    {

    }

        
    public void remove(Utilisateur utilisateur)   
    {


    }

 }
}
