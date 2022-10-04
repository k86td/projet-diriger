using Infra.Dal.Interfaces;
using Infra.Ressources;

namespace Infra.Dal.Implementations
{
    public class RatingsData : IRatingsData
    {
        // *** Missing loggers ***

        // Errors because Get(int id) and Delete(int id) cannot be implemented
        // because there is a composite primary key on this ressource.

        private readonly IDatabase _db;

        public RatingsData(IDatabase db)
        {
            _db = db;
        }

        public async Task<int> Create(RatingRessource entity)
        {
            // TODO implement returning id on creation
            await _db.ExecuteFromSP("dbo.AddRating", new
            {
                entity.IdOffre,
                entity.IdUsager,
                entity.Rating
            });
            return 0;
        }

        public async Task Edit(int id, RatingRessource modification)
        {
            await _db.ExecuteFromSP("dbo.UpdateRating", new
            {
                modification.IdUsager,
                modification.IdOffre,
                modification.Rating
            });
        }

        public async Task Delete(int idUsager, int idOffre)
        {
            await _db.ExecuteFromSP("dbo.DeleteRating", new { IdUsager = idUsager, IdOffre = idOffre });
        }

        public async Task<ICollection<RatingRessource>> Get()
        {
            return await _db.QueryFromSP<RatingRessource, dynamic>("dbo.GetAllRatings", new { });
        }

        public async Task<RatingRessource?> Get(int idUsager, int idOffre)
        {
            var ratings = await Get();
            var selectedRating = ratings.Where(r => r.IdUsager == idUsager && r.IdOffre == idOffre).FirstOrDefault();

            if (selectedRating == null)
            {
                return null;
            }

            return selectedRating;
        }

        public async Task<ICollection<RatingRessource>> GetAllOfferRatings(int id)
        {
            return await _db.QueryFromSP<RatingRessource, dynamic>("dbo.GetAllOfferRatings", new { id });
        }

        Task<List<RatingRessource>> IRatingsData.GetAllOfferRatings(int id)
        {
            throw new NotImplementedException();
        }

        public Task<RatingRessource?> Get(int id)
        {
            throw new NotImplementedException();
        }

        public Task Delete(int id)
        {
            throw new NotImplementedException();
        }
    }
}
