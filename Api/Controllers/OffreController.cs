using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

using Infra.Dal.Interfaces;
using Infra.Ressources;

namespace Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class OffreController : ControllerBase
    {
        private readonly IOffreData _offreData;

        public OffreController(IOffreData offreData)
        {
            _offreData = offreData;
        }

        [HttpPost]
        public async Task Create (OffreRessource offre)
        {
            await _offreData.Create(offre);
        }

        [HttpDelete]
        public async Task Delete(int id)
        {
            await _offreData.Delete(id);
        }

        [HttpGet]
        public async Task<ICollection<OffreRessource>> Get ([FromQuery] int[] typeId, [FromQuery] int?[] categorieId)
        {
            ICollection<OffreRessource> offres = await _offreData.Get();

            if (typeId.Length > 0)
                offres = offres.Where(o => typeId.Contains(o.IdTypeOffre)).ToList();
            if (categorieId?.Length > 0)
                offres = offres.Where(o => categorieId.Contains(o.IdCategorieOffre)).ToList();

            return offres;
        }
    }
}
