using Infra.Dal.Interfaces;
using Infra.Ressources;
using Microsoft.Extensions.Logging;

namespace Infra.Dal.Implementations
{
    public class UsagersData : IUsagersData
    {
        private readonly IDatabase _db;
        private readonly ILogger _logger;
        private readonly int _defaultRoleId;

        public UsagersData(IDatabase db, ILogger<IUsagersData> logger, IRolesData rolesData)
        {
            _db = db;
            _logger = logger;

            int? nullableRoleId = rolesData.Get().Result.Where(r => r.Nom == "NonValidatedUser").FirstOrDefault()?.Id;
            if (nullableRoleId == null)
            {
                _logger.LogCritical("We couldn't find a role with a name of 'NonValidatedUser'. We created it for you");
                var roleNonValidatedUser = new RoleRessource
                {
                    Nom = "NonValidatedUser"
                };
                rolesData.Create(roleNonValidatedUser);

            }
            
            if (nullableRoleId == null)
                nullableRoleId = rolesData.Get().Result.Where(r => r.Nom == "NonValidatedUser").First().Id;

            _defaultRoleId = nullableRoleId.Value;
        }

        public async Task<int> Create(UsagerRessource entity)
        {
            // TODO implement returning id on creation
            await _db.ExecuteFromSP("dbo.AddUsager", new 
            {
                IdRole = _defaultRoleId,
                entity.Nom,
                entity.Prenom,
                entity.Email,
                entity.Telephone,
                entity.Password,
                entity.Adresse,
                entity.Age
            });
            return 0;
        }

        public async Task Delete(int id)
        {
            await _db.ExecuteFromSP("dbo.DeleteUser", new { Id = id });
        }

        public async Task Edit(int id, UsagerRessource modification)
        {
            await _db.ExecuteFromSP("dbo.UpdateUsager", new
            {
                Id = id,
                modification.IdRole,
                modification.Nom,
                modification.Prenom,
                modification.Email,
                modification.Telephone,
                modification.Password,
                modification.Adresse
            });
        }

        public async Task<ICollection<UsagerRessource>> Get()
        {
            return await _db.QueryFromSql<UsagerRessource, dynamic?>("SELECT * FROM dbo.Usagers", null);
        }

        public async Task<UsagerRessource?> Get(int id)
        {
            var usagers = await _db.QueryFromSP<UsagerRessource, dynamic>("dbo.GetUsager", new { Id = id });
            return usagers.FirstOrDefault();
        }

        public async Task<UsagerRessource> Get(string email)
        {
            var usager = await _db.QueryFromSql<UsagerRessource, dynamic?>("SELECT * FROM dbo.Usagers", null);
            return usager.Where(u => u.Email == email).First();
        }
    }
}
