using Infra.Dal.Interfaces;
using Infra.Ressources;

namespace Infra.Dal.Implementations
{
    public class ConversationsData : IConversationsData
    {
        private readonly IDatabase _db;

        public ConversationsData(IDatabase db)
        {
            _db = db;
        }

        public async Task Create(ConversationsRessource entity)
        {
            await _db.ExecuteFromSP("dbo.AddConversation", new
            {
                entity.IdAuteur,
                entity.IdDestinataire,
                entity.Contenu,
                entity.Date
            });
        }

        public async Task Delete(int id)
        {
            await _db.ExecuteFromSP("dbo.DeleteConversation", new { Id = id });
        }

        public async Task Edit(int id, ConversationsRessource modification)
        {
            await _db.ExecuteFromSP("dbo.UpdateConversation", new
            {
                Id = id,
                modification.IdAuteur,
                modification.IdDestinataire,
                modification.Contenu,
                modification.Date
            });
        }

        public Task<ICollection<ConversationsRessource>> Get()
        {
            throw new NotImplementedException();
        }

        public Task<ConversationsRessource?> Get(int id)
        {
            throw new NotImplementedException();
        }
    }
}
