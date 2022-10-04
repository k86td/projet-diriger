using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Infra.Ressources
{
    public class DemandeOffreRessource
    {
        public int IdOffre { get; set; }
        public int IdUsager { get; set; }
        public DateTime Date { get; set; }
        public bool Accepter { get; set; }
    }
}
