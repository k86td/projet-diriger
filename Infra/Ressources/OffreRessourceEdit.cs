using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Infra.Ressources
{
    public class OffreRessourceEdit
    {
        public string Nom { get; set; }
        public float Prix { get; set; }
        public DateTime DateDebut { get; set; }
        public DateTime DateFin { get; set; }
        public string Coordonner { get; set; }
        public int? IdCategorieOffre { get; set; }
        public int IdTypeOffre { get; set; }
        public string Image { get; set; }
    }
}
