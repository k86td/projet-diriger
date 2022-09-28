using Infra.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

#pragma warning disable CS8618 // Non-nullable field must contain a non-null value when exiting constructor. Consider declaring as nullable.
namespace Infra.Ressources
{
    public class OffreRessource
    {
        public int Id { get; private set; }
        public string Nom { get; set; }
        public int IdVendeur { get; set; }
        public float Prix { get; set; }
        public DateTime Date { get; set; }
        public string Coordonner { get; set; }
        public int? IdCategorieOffre { get; set; }
        public int IdTypeOffre { get; set; }
    }
}
#pragma warning restore CS8618 // Non-nullable field must contain a non-null value when exiting constructor. Consider declaring as nullable.
