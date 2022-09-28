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

        public VoitureController(IVoitureData voitureData, ILogger<VoitureController> logger)
        {
            _voitureData = voitureData;
            _logger = logger;
        }

        [HttpGet]
        public async Task<IEnumerable<VoitureRessource>> Get()
        {
            return await _voitureData.Get();
        }

        [HttpGet("{id}")]
        [ProducesResponseType(StatusCodes.Status204NoContent)]
        public async Task<VoitureRessource?> Get (int id)
        {
            return await _voitureData.Get(id);
        }

        [HttpPost]
        public async void Post (VoitureRessource voiture)
        {
            try
            {
                await _voitureData.Create(voiture);
            }
            catch (Exception ex)
            {
                _logger.LogCritical("Fatal exception in POST:VoitureController: " + 
                    ex.Message);
            }
        }

        [HttpDelete]
        public async void Delete (int id)
        {
            await _voitureData.Delete(id);
        }

        [HttpPut("{id}")]
        public async void Put (int id, VoitureRessource voiture)
        {
            await _voitureData.Edit(id, voiture);
        }
    }
}
