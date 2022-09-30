using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

using Infra.Dal.Interfaces;
using Infra.Ressources;

namespace Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [AllowAnonymous]
    public class CategorieOffreController : ControllerBase
    {
        private readonly ICategorieOffreData _categorieOffreData;

        public CategorieOffreController(ICategorieOffreData categorieOffreData)
        {
            _categorieOffreData = categorieOffreData;
        }

        [HttpPost]
        public async Task Create (CategoriesOffresRessource categorie)
        {
            await _categorieOffreData.Create(categorie);
        }

        [HttpDelete]
        public async Task Delete (int id)
        {
            await _categorieOffreData.Delete(id);
        }

        [HttpPut]
        public async Task Edit (int id, CategoriesOffresRessource modification)
        {
            await _categorieOffreData.Edit(id, modification);
        }

        [HttpGet("ids")]
        public async Task<ICollection<CategoriesOffresRessource>> Get([FromQuery] int[] id)
        {
            var categories = await _categorieOffreData.Get();
            return categories.Where(c => id.Contains(c.IdType)).ToList();
        }

        [HttpGet]
        public async Task<ICollection<CategoriesOffresRessource>> Get()
        {
            return await _categorieOffreData.Get();
        }
    }
}
