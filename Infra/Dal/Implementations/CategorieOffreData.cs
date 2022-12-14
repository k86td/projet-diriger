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

        public async Task<int> Create(CategoriesOffresRessource entity)
        {
            // TODO implement returning id on creation
            await _db.ExecuteFromSql(
                "INSERT INTO dbo.CategoriesOffres (IdType, Nom) VALUES (@IdType, @Nom)",
                new
                {
                    entity.IdType,
                    entity.Nom
                });
            return 0;
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

        public async Task<ICollection<CategoriesOffresRessource>> Get()
        {
            return await _db.QueryFromSql<CategoriesOffresRessource, dynamic?>(
                "SELECT * FROM dbo.CategoriesOffres", null);
        }

        public async Task<CategoriesOffresRessource?> Get(int id)
        {
            var categoriesOffres = await _db.QueryFromSql<CategoriesOffresRessource, dynamic>(
                "SELECT * FROM dbo.CategoriesOffres WHERE Id = @Id",
                new
                {
                    Id = id
                });
            return categoriesOffres.FirstOrDefault();
        }
    }
}
