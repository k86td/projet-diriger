using Infra.Dal.Interfaces;
using Infra.Ressources;
using Microsoft.AspNetCore.Mvc;

namespace Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class RatingController : ControllerBase
    {
        private readonly IRatingsData _ratingData;

        public RatingController(IRatingsData ratingData)
        {
            _ratingData = ratingData;
        }

        [HttpPost]
        public async void Create(RatingRessource rating)
        {
             await _ratingData.Create(rating);
        }

        [HttpDelete]
        public async Task Delete(int idUsager, int idVendeur)
        {
            await _ratingData.Delete(idUsager, idVendeur);
        }

        [HttpGet("{idVendeur}")]
        public async Task<ICollection<RatingRessource>> Get(int idVendeur)
        {
            return await _ratingData.GetAllSellerRatings(idVendeur);
        }
    }
}
