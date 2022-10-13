using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

using Infra.Dal.Interfaces;
using Infra.Ressources;
using Microsoft.AspNetCore.Authorization;
using System.Security.Claims;
using Infra.Dal.Implementations;

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


        [HttpPut("{id}")]
        public async void Edit(int id, [FromBody] OffreRessourceEdit offreEdit)
        {
            var offer = await _offreData.Get(id);

            if (offer == null)
                throw new ArgumentNullException("Offer cannot be null");

            OffreRessource offre = new OffreRessource
            {
                Nom = offreEdit.Nom,
                IdVendeur = offer.IdVendeur, //Pour garder l'id du vendeur
                Prix = offreEdit.Prix,
                Coordonner = offreEdit.Coordonner,
                IdCategorieOffre = offreEdit.IdCategorieOffre,
                IdTypeOffre = offreEdit.IdTypeOffre,
                DateDebut = offreEdit.DateDebut,
                DateFin = offreEdit.DateFin
            };

            await _offreData.Edit(id, offre);
        }

        [HttpGet("{id}")]
        [ProducesResponseType(StatusCodes.Status204NoContent)]
        public async Task<OffreRessource?> Get(int id)
        {
            return await _offreData.Get(id);
        }

        [HttpGet("Seller/{idSeller}")]
        public async Task<ICollection<OffreRessource>> GetOffersBySellerId(int idSeller)
        {
            ICollection<OffreRessource> offres = await _offreData.GetOffresBySellerId(idSeller);

            if (offres == null)
                return new List<OffreRessource>();

            return offres;
        }

        [HttpPost("Rent/{id}")]
        [Authorize]
        public async Task CreateRent (int id)
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

        [HttpDelete("Rent/{id}")]
        [Authorize]
        public async Task DeleteRent(int id)
        {
            string userEmail = User.Claims.Where(c => c.Type == ClaimTypes.Email).First().Value;
            var offre = await _offreData.Get(id);
            var usager = await _usagerData.Get(userEmail);

            if (offre == null)
                throw new ArgumentNullException("You sent an invalid OffreId!");
            else if (usager == null)
                throw new ArgumentNullException("You are not logged in!");

            await _demandeOffreData.Delete(offre.Id, usager.Id);
        }
    }
}
