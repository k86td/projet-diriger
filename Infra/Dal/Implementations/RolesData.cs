using Infra.Dal.Interfaces;
using Infra.Ressources;

namespace Infra.Dal.Implementations
{
    public class RolesData : IRolesData 
    {
        private readonly IDatabase _db;

        public RolesData(IDatabase db)
        {
            _db = db;
        }

        public RoleRessource Create(RoleRessource entity)
        {
            throw new NotImplementedException();
        }

        public void Delete(int id)
        {
            throw new NotImplementedException();
        }

        public RoleRessource Edit(int id, RoleRessource modification)
        {
            throw new NotImplementedException();
        }

        public ICollection<RoleRessource> Get()
        {
            throw new NotImplementedException();
        }

        public RoleRessource Get(int id)
        {
            throw new NotImplementedException();
        }
    }
}
