using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

using Infra.Dal.Interfaces;
using Infra.Ressources;
using Microsoft.AspNetCore.Authorization;
using System.Security.Claims;

namespace Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class OffreController : ControllerBase
    {
        private readonly IOffreData _offreData;
        private readonly IDemandeOffreData _demandeOffreData;
        private readonly IUsagersData _usagerData;

        public OffreController(IOffreData offreData, IDemandeOffreData demandeOffreData, IUsagersData usagerData)
        {
            _offreData = offreData;
            _demandeOffreData = demandeOffreData;
            _usagerData = usagerData;
        }

        [HttpPost]
        public async Task<int> Create (OffreRessource offre)
        {
            int id = await _offreData.Create(offre);
            return id;
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

        [HttpPost("Rent/{id}")]
        [Authorize]
        public async Task Rent (int id)
        {
            string userEmail = User.Claims.Where(c => c.Type == ClaimTypes.Email).First().Value;
            var offre = await _offreData.Get(id);
            var usager = await _usagerData.Get(userEmail);

            if (offre == null)
                throw new ArgumentNullException("You sent an invalid OffreId!");
            else if (usager == null)
                throw new ArgumentNullException("You are not logged in!");

            DemandeOffreRessource demande = new()
            {
                IdOffre = offre.Id,
                IdUsager = usager.Id,
            };
            await _demandeOffreData.Create(demande);
        }
    }
}
