using Infra.Dal.Interfaces;
using Infra.Ressources;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Infra.Dal.Implementations
{
    public class DemandesData : IDemandesData
    {
        private readonly IDatabase _db;

        public DemandesData(IDatabase db)
        {
            _db = db;
        }

        public async Task Create(DemandesRessource entity)
        {
            await _db.ExecuteFromSP("AddDemande", new { entity.IdUsager });
        }

        public async Task Delete(int id)
        {
            await _db.ExecuteFromSP("DeleteDemande", new { id });
        }

        public Task Edit(int id, DemandesRessource modification)
        {
            throw new NotImplementedException();
        }

        public async Task<ICollection<DemandesRessource>> Get()
        {
            return await _db.QueryFromSql<DemandesRessource, dynamic?>("SELECT * FROM dbo.Demandes", null);
        }

        public Task<DemandesRessource?> Get(int id)
        {
            throw new NotImplementedException();
        }
    }
}
