using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

using Infra.Ressources;
using Infra.Dal.Interfaces;

namespace Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class VoitureController : ControllerBase
    {
        private readonly IVoitureData _voitureData;
        private readonly ILogger<VoitureController> _logger;

        public VoitureController(IVoitureData voitureData, ITypeOffreData typeOffreData, ILogger<VoitureController> logger)
        {
            _voitureData = voitureData;
            _logger = logger;

            // create a custom attribute for this
            var type = typeOffreData.Get().Result.Where(t => t.Nom == "Voiture").FirstOrDefault();
            if (type == null)
            {
                var typeVoiture = new TypeOffreRessource
                {
                    Nom = "Voiture"
                };
                typeOffreData.Create(typeVoiture);
            }

        }

        [HttpGet]
        public async Task<IEnumerable<VoitureRessource>> Get(int? idOffre = null)
        {
            var voitures = await _voitureData.Get();

            if (idOffre != null)
                return voitures.Where(v => v.IdOffre == idOffre).ToList();

            return voitures;
        }

        [HttpGet("{id}")]
        [ProducesResponseType(StatusCodes.Status204NoContent)]
        public async Task<VoitureRessource?> Get(int id)
        {
            return await _voitureData.Get(id);
        }

        [HttpPost]
        public async Task<IActionResult> Post(VoitureRessource voiture)
        {
            try
            {
                await _voitureData.Create(voiture);
                return Ok();
            }
            catch (Exception ex)
            {
                _logger.LogCritical("Fatal exception in POST:VoitureController: " +
                    ex.Message);
                return BadRequest();
            }
        }

        [HttpDelete]
        public async void Delete(int id)
        {
            await _voitureData.Delete(id);
        }

        [HttpPut]
        public async void Put(VoitureRessource voiture)
        {
            await _voitureData.Edit(voiture.IdOffre, voiture);
        }
    }
}
