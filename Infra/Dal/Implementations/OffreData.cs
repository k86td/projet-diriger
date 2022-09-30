using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Infra.Dal.Interfaces;
using Infra.Ressources;

namespace Infra.Dal.Implementations
{
    public class OffreData : IOffreData
    {
        private readonly IDatabase _db;

        public OffreData(IDatabase db)
        {
            _db = db;
        }

        public async Task Create(OffreRessource entity)
        {
            await _db.ExecuteFromSql("INSERT INTO dbo.Offres (Nom, IdVendeur, Prix, Coordonner, IdCategorieOffre, IdTypeOffre) OUTPUT Inserted OUTPUT inserted.id VALUES (@Nom, @IdVendeur, @Prix, @Coordonner, @IdCategorieOffre, @IdTypeOffre)",
                new
                {
                    entity.Nom,
                    entity.IdVendeur,
                    entity.Prix,
                    entity.Coordonner,
                    entity.IdCategorieOffre,
                    entity.IdTypeOffre
                });
        }

        public async Task Delete(int id)
        {
            await _db.ExecuteFromSql("DELETE FROM dbo.Offres WHERE Id = @Id",
                new
                {
                    Id = id
                });
        }

        public async Task Edit(int id, OffreRessource modification)
        {
            await _db.ExecuteFromSql("UPDATE dbo.Offres SET Nom = @Nom, Prix = @Prix, Date = @Date, Coordonner = @Coordonner, IdTypeOffre = @IdTypeOffre, IdCategorieOffre = @IdCategorieOffre WHERE Id = @Id",
                new
                {
                    Id = id,
                    modification.Nom,
                    modification.Prix,
                    modification.Date,
                    modification.Coordonner
                });
        }

        public async Task<ICollection<OffreRessource>> Get()
        {
            return await _db.QueryFromSql<OffreRessource, dynamic?>("SELECT * FROM dbo.Offres", null);
        }

        public async Task<OffreRessource?> Get(int id)
        {
            var offres = await _db.QueryFromSql<OffreRessource, dynamic>("SELECT * FROM dbo.Offres WHERE Id = @Id",
                new
                {
                    Id = id
                });
            return offres.FirstOrDefault();
        }
    }
}
