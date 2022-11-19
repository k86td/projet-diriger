using Microsoft.AspNetCore.Mvc;
using Infra.Dal.Interfaces;
using Infra.Ressources;
using Infra.Dal.Implementations;
using Microsoft.Extensions.Logging;

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
        [HttpPost]
        public async Task<IActionResult> Post(ConversationsRessource conversation)
        {
            try
            {
                await _ConversationsData.Create(conversation);
                return Ok();
            }
            catch (Exception ex)
            {
                return BadRequest();
            }
        }

    }
}
