using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Infra.Dal.Interfaces;
using Infra.Ressources;

namespace Infra.Dal.Implementations
{
    public class CategorieOffreData : ICategorieOffreData
    {
        private readonly IDatabase _db;

        public CategorieOffreData(IDatabase db)
        {
            _db = db;
        }

        public async Task Create(CategoriesOffresRessource entity)
        {
            await _db.ExecuteFromSql(
                "INSERT INTO dbo.CategoriesOffres (IdType, Nom) VALUES (@IdType, @Nom)",
                new
                {
                    entity.IdType,
                    entity.Nom
                });
        }

        public async Task Delete(int id)
        {
            await _db.ExecuteFromSql(
                "DELETE FROM dbo.CategoriesOffres WHERE Id = @Id",
                new
                {
                    Id = id
                });
        }

        public async Task Edit(int id, CategoriesOffresRessource modification)
        {
            await _db.ExecuteFromSql(
                "UPDATE dbo.CategoriesOffres SET Nom = @Nom WHERE IdType = @IdType",
                new
                {
                    modification.IdType
                });
        }

        public Task<ICollection<CategoriesOffresRessource>> Get()
        {
            throw new NotImplementedException();
        }

        public Task<CategoriesOffresRessource?> Get(int id)
        {
            throw new NotImplementedException();
        }
    }
}
