using Infra.Ressources;

namespace Infra.Dal.Interfaces
{
    public interface IDemandeOffreData
    {
        public Task Create(DemandeOffreRessource demandeOffre);

        public Task Delete(int idOffre, int idUsager);

        public Task<ICollection<DemandeOffreRessource>> GetAllUserDemandeOffre(int idUser);

        public Task<ICollection<DemandeOffreRessource>> GetAllDemandesByOffreId(int idOffre);
    }
}
