using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Infra.Dal.Interfaces;
using Infra.Ressources;

namespace Infra.Dal.Implementations
{
    public class TypeOffreData : ITypeOffreData
    {
        private readonly IDatabase _db;

        public TypeOffreData(IDatabase db)
        {
            _db = db;
        }

        public async Task Create(TypeOffreRessource entity)
        {
            await _db.ExecuteFromSql(
                "INSERT INTO dbo.TypesOffres (Nom) VALUES (@Nom)",
                new
                {
                    entity.Nom
                });
        }

        public async Task Delete(int id)
        {
            await _db.ExecuteFromSql(
                "DELETE FROM dbo.TypesOffres WHERE Id = @Id",
                new
                {
                    Id = id
                });
        }

        public async Task Edit(int id, TypeOffreRessource modification)
        {
            await _db.ExecuteFromSql(
                "UPDATE dbo.TypesOffres SET Nom = @Nom WHERE Id = @Id",
                new
                {
                    modification.Nom,
                    Id = id
                });
        }

        public async Task<ICollection<TypeOffreRessource>> Get()
        {
            return await _db.QueryFromSql<TypeOffreRessource, dynamic?>(
                "SELECT * FROM dbo.TypesOffres", null);
        }

        public async Task<TypeOffreRessource?> Get(int id)
        {
            var typesOffres = await _db.QueryFromSql<TypeOffreRessource, dynamic>(
                "SELECT * FROM dbo.TypesOffres WHERE Id = @Id",
                new
                {
                    Id = id
                });

            return typesOffres.FirstOrDefault();
        }
    }
}
