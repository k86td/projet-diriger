using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Infra.Ressources;

namespace Infra.Dal.Interfaces
{
    public interface IOffreData : ICrudData<OffreRessource>
    {
        public Task<ICollection<OffreRessource>> GetOffresBySellerId(int id); 

    }
}
