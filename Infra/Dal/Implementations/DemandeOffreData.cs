using Infra.Dal.Interfaces;
using Infra.Ressources;

namespace Infra.Dal.Implementations
{
    public class DemandeOffreData : IDemandeOffreData
    {
        private readonly IDatabase _db;

        public DemandeOffreData(IDatabase db)
        {
            _db = db;
        }

        public async Task Create(DemandeOffreRessource entity)
        {
            await _db.ExecuteFromSP("dbo.AddDemandeOffre", new
            {
                entity.IdOffre,
                entity.IdUsager
            });
        }

        public async Task Delete(int idOffre, int idUsager)
        {
            await _db.ExecuteFromSP("dbo.RemoveDemandeOffre", new
            {
                idOffre, idUsager
            });
        }
    }
}
