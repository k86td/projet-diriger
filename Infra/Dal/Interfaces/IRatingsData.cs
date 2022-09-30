using Infra.Ressources;
using System.Runtime.CompilerServices;

namespace Infra.Dal.Interfaces
{
    public interface IRatingsData : ICrudData<RatingRessource>
    {
        public Task<List<RatingRessource>> GetAllOfferRatings(int id);
    }
}
