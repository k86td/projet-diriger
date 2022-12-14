using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Infra.Ressources
{
#pragma warning disable CS8618 // Un champ non-nullable doit contenir une valeur non-null lors de la fermeture du constructeur. Envisagez de déclarer le champ comme nullable.
    public class ConversationsRessource
    {
        public int Id { get; private set; }
        public int IdAuteur { get; set; }
        public int IdDestinataire { get; set; }
        public string Contenu { get; set; }
        public DateTime Date { get; set; }
    }
#pragma warning restore CS8618 // Un champ non-nullable doit contenir une valeur non-null lors de la fermeture du constructeur. Envisagez de déclarer le champ comme nullable.
}
