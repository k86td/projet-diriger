using Infra.Dal.Interfaces;
using Infra.Ressources;
using Microsoft.VisualBasic.FileIO;

namespace Infra.Dal.Implementations
{
    public class TypesOffreData : ITypeOffreData
    {
        // *** Missing loggers ***

        private readonly IDatabase _db;

        public TypesOffreData(IDatabase db)
        {
            _db = db;
        }

        public async Task Create(TypeOffreRessource entity)
        {
            await _db.ExecuteFromSP("dbo.AddTyppeOffre", new { entity.Nom });
        }

        public async Task Delete(int id)
        {
            await _db.ExecuteFromSP("dbo.DeleteTypeOffre", new { Id = id });
        }

        public async Task Edit(int id, TypeOffreRessource modification)
        {
            await _db.ExecuteFromSP("dbo.UpdateTypeOffre", new
            {
                Id = id,
                modification.Nom
            });
        }

        public async Task<ICollection<TypeOffreRessource>> Get()
        {
            return await _db.QueryFromSP<TypeOffreRessource, dynamic>("dbo.GetAllTypesOffre", new { });
        }

        public async Task<TypeOffreRessource?> Get(int id)
        {
            var types = await Get();
            var selectedType = types.Where(t => t.Id == id).FirstOrDefault();

            if (selectedType == null)
            {
                return null;
            }

            return selectedType;
        }
    }
}
