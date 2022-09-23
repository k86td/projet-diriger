using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Infra.Dal.Interfaces;
using Infra.Ressources;

namespace Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UsagerController : ControllerBase
    {
        private readonly IUsagersData _usagersData;

        public UsagerController(IUsagersData usagersData)
        {
            _usagersData = usagersData;
        }

        [HttpGet]
        public async Task<IEnumerable<UsagerRessource>> Get()
        {
            return await _usagersData.Get();
        }

        [HttpPost]
        public async void Post (UsagerRessource usager)
        {
            await _usagersData.Create(usager);
        }

        [HttpDelete] 
        public async void Delete (int id)
        {
            await _usagersData.Delete(id);
        }
    }
}
