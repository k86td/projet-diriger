using Microsoft.AspNetCore.Mvc;
using Infra.Dal.Interfaces;
using Infra.Ressources;
using Infra.Dal.Implementations;

namespace Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ConversationsController : ControllerBase
    {
        private readonly IConversationsData _ConversationsData;
        public ConversationsController(IConversationsData ConversationsData)
        {
            _ConversationsData = ConversationsData;
        }
        [HttpGet]
        public async Task<IEnumerable<ConversationsRessource>> Get()
        {
            return await _ConversationsData.Get();
        }
      
    }
}
