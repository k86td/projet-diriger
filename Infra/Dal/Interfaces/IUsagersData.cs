using Infra.Ressources;

namespace Infra.Dal.Interfaces
{
    public interface IUsagersData : ICrudData<UsagerRessource>
    {
        public Task<UsagerRessource> Get(string email);
    }
}
