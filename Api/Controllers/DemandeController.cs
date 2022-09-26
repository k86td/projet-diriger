using Infra.Dal.Interfaces;
using Infra.Ressources;
using Microsoft.AspNetCore.Mvc;
using System.Security.Cryptography.X509Certificates;

namespace Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class DemandeController : ControllerBase
    {
        private readonly IDemandesData _demandesData;

        public DemandeController(IDemandesData demandesData)
        {
            _demandesData = demandesData;
        }

        [HttpGet]
        public async Task<IEnumerable<DemandesRessource>> Get()
        {
            return await _demandesData.Get();
        }

        [HttpPost]
        public async void Post (DemandesRessource demande)
        {
            await _demandesData.Create(demande);
        }

        [HttpDelete]
        public async void Delete (int id)
        {
            await _demandesData.Delete(id);
        }

    }
}
