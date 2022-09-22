using Infra.Dal.Interfaces;
using Infra.Ressources;

namespace Infra.Dal.Implementations
{
    public class UsagersData : IUsagersData
    {
        private readonly IDatabase _db;

        public UsagersData(IDatabase db)
        {
            _db = db;
        }

        public UsagerRessource Create(UsagerRessource entity)
        {
            throw new NotImplementedException();
        }

        public void Delete(int id)
        {
            throw new NotImplementedException();
        }

        public UsagerRessource Edit(int id, UsagerRessource modification)
        {
            throw new NotImplementedException();
        }

        public ICollection<UsagerRessource> Get()
        {
            throw new NotImplementedException();
        }

        public UsagerRessource Get(int id)
        {
            throw new NotImplementedException();
        }
    }
}
