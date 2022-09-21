using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Infra.Ressources
{
    public class RatingRessource
    {
        public int IdOffre { get; private set; }
        public int IdUsager { get; private set; }
        public int Rating { get; set; }
    }
}
