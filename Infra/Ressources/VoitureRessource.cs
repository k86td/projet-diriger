using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

#pragma warning disable CS8618 // Un champ non-nullable doit contenir une valeur non-null lors de la fermeture du constructeur. Envisagez de déclarer le champ comme nullable.
namespace Infra.Ressources
{
    public class VoitureRessource
    {
        public int IdOffre { get; set; }
        public string Couleur { get; set; }
        public string Marque { get; set; }
        public int Odometre { get; set; }
        public string TypeVehicule { get; set; }
        public int NombrePorte { get; set; }
        public int NombreSiege { get; set; }
        public string Traction { get; set; }
        public string Description { get; set; }
        public bool Accidente { get; set; }
    }
}
#pragma warning restore CS8618 // Un champ non-nullable doit contenir une valeur non-null lors de la fermeture du constructeur. Envisagez de déclarer le champ comme nullable.
