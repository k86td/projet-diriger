using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Infra.Dal.Interfaces;
using Infra.Ressources;
using System.Security.Claims;

namespace Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class DemandeOffreController : ControllerBase
    {
        private readonly IDemandeOffreData _demandeOffreData;
        private readonly IUsagersData _usagerData;

        public DemandeOffreController(IDemandeOffreData demandeOffreData, IUsagersData usagersData)
        {
            _demandeOffreData = demandeOffreData;
            _usagerData = usagersData;
        }

        [HttpGet]
        [Authorize]
        public async Task<ICollection<DemandeOffreRessource>> Get()
        {
            string userEmail = User.Claims.Where(c => c.Type == ClaimTypes.Email).First().Value;
            var usager = await _usagerData.Get(userEmail);

            return await _demandeOffreData.GetAllUserDemandeOffre(usager.Id);
        }

        [HttpGet("{offreId}")]
        [Authorize]
        public async Task<DemandeOffreRessource?> Get(int offreId)
        {
            // TODO move this inside the database
            string userEmail = User.Claims.Where(c => c.Type == ClaimTypes.Email).First().Value;
            var usager = await _usagerData.Get(userEmail);

            var demandesOffres = await _demandeOffreData.GetAllUserDemandeOffre(usager.Id);
            return demandesOffres.Where(d => d.IdOffre == offreId).FirstOrDefault();
        }
    }
}
