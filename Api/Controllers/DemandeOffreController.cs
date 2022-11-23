using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Infra.Dal.Interfaces;
using Infra.Ressources;
using System.Security.Claims;
using Infra.Dal.Implementations;
using System.ComponentModel.DataAnnotations;

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

        // this should be secured
        [HttpGet("userDemande")]
        public async Task<DemandeOffreRessource?> Get(int IdOffre, int IdUsager)
        {
            var allDemandeOffre = await _demandeOffreData.GetAllDemandesByOffreId(IdOffre);
            return allDemandeOffre.Where(d => d.IdUsager == IdUsager).FirstOrDefault();
        }

        //[HttpGet("{offreId}")]
        //[Authorize]
        //public async Task<DemandeOffreRessource?> Get(int offreId)
        //{
        //    // TODO move this inside the database
        //    string userEmail = User.Claims.Where(c => c.Type == ClaimTypes.Email).First().Value;
        //    var usager = await _usagerData.Get(userEmail);

        //    var demandesOffres = await _demandeOffreData.GetAllUserDemandeOffre(usager.Id);
        //    return demandesOffres.Where(d => d.IdOffre == offreId).FirstOrDefault();
        //}

        [HttpGet("offre/{idOffre}")]
        public async Task<ICollection<DemandeOffreRessource>> Get(int idOffre)
        {
            var demandeOffres = await _demandeOffreData.GetAllDemandesByOffreId(idOffre);
            return demandeOffres;
        }
        
        [HttpPut("{id}")]
        public async void Put(int id, int idUsager, DemandeOffreRessource demandeOffre)
        {
            await _demandeOffreData.Edit(id, idUsager, demandeOffre);
        }

        [HttpPut("Accept")]
        public async void Put(int idOffre, int idUsager)
        {
            await _demandeOffreData.Accepter(idOffre, idUsager);
        }
        [HttpDelete]
        public async Task Delete(int idOffre, int idUsager)
        {
            await _demandeOffreData.Delete(idOffre,idUsager);
        }
    }
}
