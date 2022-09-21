using Infra.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Infra.Ressources
{
    public class OffreRessource
    {
        public int Id { get; private set; }
        public int IdVendeur { get; set; }
        public float Prix { get; set; }
        public DateTime Date { get; set; }
        public string Coordonner { get; set; }
    }
}
