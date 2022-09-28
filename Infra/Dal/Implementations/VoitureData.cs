using Infra.Dal.Interfaces;
using Infra.Ressources;

namespace Infra.Dal.Implementations
{
    public class VoitureData : IVoitureData
    {
        private readonly IDatabase _db;

        public VoitureData(IDatabase db, ITypeOffreData typeOffre)
        {
            _db = db;

            // ensure that we have the Voiture typeOffre
            var types = typeOffre.Get().Result.Where(t => t.Nom == "Voiture");

            if (types == null)
            {
                TypeOffreRessource voitureRessource = new()
                {
                    Nom = "Voiture"
                };
                typeOffre.Create(voitureRessource);
            }
        }

        public async Task Create(VoitureRessource entity)
        {
            await _db.ExecuteFromSP("dbo.CreateVoiture", new
            {
                entity.IdOffre,
                entity.Couleur,
                entity.Marque,
                entity.Odometre,
                entity.TypeVehicule,
                entity.NombrePorte,
                entity.NombreSiege,
                entity.Traction,
                entity.Description,
                entity.Accidente
            });
        }

        public async Task Delete(int id)
        {
            await _db.ExecuteFromSP("dbo.DeleteVoiture", new
            {
                Id = id
            });
        }

        public async Task Edit(int id, VoitureRessource modification)
        {
            await _db.ExecuteFromSP("dbo.EditVoiture", new
            {
                IdOffre = id,
                modification.Couleur,
                modification.Marque,
                modification.Odometre,
                modification.TypeVehicule,
                modification.NombrePorte,
                modification.NombreSiege,
                modification.Traction,
                modification.Description,
                modification.Accidente
            });
        }

        public async Task<ICollection<VoitureRessource>> Get()
        {
            return await _db.QueryFromSP<VoitureRessource, dynamic?>("dbo.GetVoiture", null);
        }

        public async Task<VoitureRessource?> Get(int id)
        {
            var voitures = await this.Get();
            return voitures.Where(v => v.IdOffre == id).FirstOrDefault();
        }
    }
}
