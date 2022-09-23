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

        [HttpGet("{id}")]
        [ProducesResponseType(StatusCodes.Status204NoContent)]
        public async Task<UsagerRessource?> Get(int id)
        {
            return await _usagersData.Get(id);
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

        [HttpPut("{id}")]
        public async void Put (int id, [FromBody] UsagerRessource usager)
        {
            await _usagersData.Edit(id, usager);
        }
    }
}
