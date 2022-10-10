using Infra.Dal.Interfaces;
using Infra.Ressources;


namespace Infra.Dal.Implementations
{
    public class DemandesData : IDemandesData
    {
        private readonly IDatabase _db;

        public DemandesData(IDatabase db)
        {
            _db = db;
        }

        public async Task<int> Create(DemandesRessource entity)
        {
            // TODO implement returning id on creation
            await _db.ExecuteFromSP("dbo.AddDemande", new { IdUser = entity.IdUsager });
            return 0;
        }

        public async Task Delete(int id)
        {
            await _db.ExecuteFromSP("dbo.DeleteDemande", new { id });
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
