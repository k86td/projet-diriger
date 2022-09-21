using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Infra.Ressources
{
    public class ConversationsRessource
    {
        public int Id { get; set; }
        public int IdAuteur { get; set; }
        public int IdDestinataire { get; set; }
        public string Contenu { get; set; }
        public DateTime Date { get; set; }
    }
}
