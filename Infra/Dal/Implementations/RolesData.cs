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

        public async Task<int> Create(RoleRessource entity)
        {
            // TODO implement returning id on creation
            await _db.ExecuteFromSP("dbo.AddRoles", new { entity.Nom });
            return 0;
        }

        public async Task Delete(int id)
        {
            await _db.ExecuteFromSP("dbo.DeleteRole", new { Id = id });
        }

        public async Task Edit(int id, RoleRessource modification)
        {
            await _db.ExecuteFromSP("dbo.UpdateRole", new
            {
                Id = id,
                modification.Nom
            });
        }

        public async Task<ICollection<RoleRessource>> Get()
        {
            return await _db.QueryFromSP<RoleRessource, dynamic>("dbo.GetAllRoles", 
                new { });
        }

        public async Task<RoleRessource?> Get(int id)
        {
            var roles = await Get();
            var selectedRole = roles.Where(r => r.Id == id).FirstOrDefault();

            if (selectedRole == null)
                return null;

            return selectedRole;

        }
    }
}
