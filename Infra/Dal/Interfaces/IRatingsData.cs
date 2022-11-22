﻿using Infra.Ressources;
using System.Runtime.CompilerServices;

namespace Infra.Dal.Interfaces
{
    public interface IRatingsData : ICrudData<RatingRessource>
    {
        public Task<List<RatingRessource>> GetAllSellerRatings(int id);

        public Task Delete(int idUsager, int idVendeur);
        
    }
}
