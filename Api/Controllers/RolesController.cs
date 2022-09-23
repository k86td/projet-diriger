using Microsoft.AspNetCore.Mvc;
using Infra.Dal.Interfaces;
using Infra.Ressources;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class RolesController : ControllerBase
    {
        private readonly IRolesData _rolesData;

        public RolesController(IRolesData rolesData)
        {
            _rolesData = rolesData;
        }

        [HttpGet]
        public async Task<IEnumerable<RoleRessource>> Get()
        {
           return await _rolesData.Get();
        }

        [HttpGet("{id}")]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        public async Task<RoleRessource?> Get(int id)
        {
            return await _rolesData.Get(id);
        }

        [HttpPost]
        public async void Post(RoleRessource role)
        {
            await _rolesData.Create(role);
        }

        [HttpPut("{id}")]
        public async void Put(int id, [FromBody] RoleRessource role)
        {
            await _rolesData.Edit(id, role);
        }

        [HttpDelete("{id}")]
        public async void Delete(int id)
        {
            await _rolesData.Delete(id);
        }
    }
}
