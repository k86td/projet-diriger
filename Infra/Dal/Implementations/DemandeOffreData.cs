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
                entity.IdUsager,
                entity.Date
            });
        }

        public async Task Edit(int id, int idUsager, DemandeOffreRessource entity)
        {
            await _db.ExecuteFromSql("UPDATE dbo.DemandesOffres SET [Date] = @Date, Accepter = @Accepter WHERE IdOffre = @Id AND IdUsager = @IdUsager", new
            {
                Id = id,
                IdUsager = idUsager,
                Date = entity.Date,
                Accepter = entity.Accepter
            });
        }

        public async Task Delete(int idOffre, int idUsager)
        {
            await _db.ExecuteFromSP("dbo.RemoveDemandeOffre", new
            {
                idOffre, idUsager
            });
        }

        public async Task<ICollection<DemandeOffreRessource>> GetAllUserDemandeOffre(int idUser)
        {
            return await _db.QueryFromSql<DemandeOffreRessource, dynamic>("SELECT * FROM dbo.DemandesOffres WHERE IdUsager = @IdUsager",
                new
                {
                    IdUsager = idUser
                });
        }

        public async Task<ICollection<DemandeOffreRessource>> GetAllDemandesByOffreId(int idOffre)
        {
            {
                return await _db.QueryFromSql<DemandeOffreRessource, dynamic>("SELECT * FROM dbo.DemandesOffres WHERE IdOffre = @IdOffre",
                    new
                    {
                        IdOffre = idOffre
                    });
            }
        }
    }
}
