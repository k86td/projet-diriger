using Infra.Dal.Interfaces;
using Infra.Ressources;
using Microsoft.AspNetCore.Mvc;

namespace Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class VendeurController : ControllerBase
    {

        private readonly IVendeursData _vendeursData;

        public VendeurController(IVendeursData vendeursData)
        {
            _vendeursData = vendeursData;
        }

        [HttpGet]
        public async Task<IEnumerable<VendeurRessource>> Get()
        {
            return await _vendeursData.Get();
        }

        [HttpPost]
        public async void Post(VendeurRessource vendeur)
        {
            await _vendeursData.Create(vendeur);
        }

        [HttpDelete]
        public async void Delete(int id)
        {
            await _vendeursData.Delete(id);
        }
    }
}
