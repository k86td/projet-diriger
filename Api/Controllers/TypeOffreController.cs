using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

using Infra.Dal.Interfaces;
using Infra.Ressources;
using Microsoft.AspNetCore.Cors;

namespace Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class TypeOffreController : ControllerBase
    {
        private readonly ITypeOffreData _typeOffreData;

        public TypeOffreController(ITypeOffreData typeOffreData)
        {
            _typeOffreData = typeOffreData;
        }

        [HttpPost]
        public async Task Create(TypeOffreRessource typeOffre)
        {
            await _typeOffreData.Create(typeOffre);
        }

        [HttpDelete]
        public async Task Delete(int id)
        {
            await _typeOffreData.Delete(id);
        }

        [HttpPut]
        public async Task Edit(int id, TypeOffreRessource typeOffre)
        {
            await _typeOffreData.Edit(id, typeOffre);
        }

        [HttpGet("{id}")]
        public async Task<TypeOffreRessource?> Get(int id)
        {
            return await _typeOffreData.Get(id);
        }

        [HttpGet]
        public async Task<ICollection<TypeOffreRessource>> Get()
        {
            return await _typeOffreData.Get();
        }
    }
}
