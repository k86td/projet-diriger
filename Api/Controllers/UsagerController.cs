﻿using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Infra.Dal.Interfaces;
using Infra.Ressources;
using Infra.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.IdentityModel.Tokens;
using System.Text;
using System.Security.Claims;
using System.IdentityModel.Tokens.Jwt;

namespace Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [Authorize]
    public class UsagerController : ControllerBase
    {
        private readonly IUsagersData _usagersData;
        private readonly IRolesData _roleData;
        private readonly IConfiguration _config;

        public UsagerController(IUsagersData usagersData, IRolesData roleData, IConfiguration config, ILogger<UsagerController> logger)
        {
            _usagersData = usagersData;
            _roleData = roleData;
            _config = config;
        }

        [HttpGet("MonUsager")]
        [Authorize]
        public async Task<UsagerRessource> GetCurrentUser ()
        {
            var usager = await _usagersData.Get();
            return usager.Where(u => u.Email == User.Claims.Where(c => c.Type == ClaimTypes.Email).First().Value).First();
        }

        [HttpGet]
        [Authorize(Roles = "Admin")]
        public async Task<IEnumerable<UsagerRessource>> Get()
        {
            return await _usagersData.Get();
        }

        [HttpGet("{id}")]
        [ProducesResponseType(StatusCodes.Status204NoContent)]
        public async Task<UsagerRessource?> Get(int id)
        {
            return await _usagersData.Get(id);
        }

        [HttpPost]
        [AllowAnonymous]
        public async void Post (UsagerRessource usager)
        {
            await _usagersData.Create(usager);
        }

        [HttpDelete] 
        public async void Delete (int id)
        {
            await _usagersData.Delete(id);
        }

        [HttpPut("{id}")]
        public async void Put (int id, [FromBody] UsagerRessource usager)
        {
            await _usagersData.Edit(id, usager);
        }

        [HttpPost("login")]
        [AllowAnonymous]
        public async Task<IActionResult> Login ([FromBody] UsagerLoginModel login) 
        {
            var user = await Authenticate(login);

            if (user != null)
            {
                var token = await Generate(user);
                return Ok(token);
            }

            return NotFound("User couldn't be found");
        }

        private async Task<string?> Generate(UsagerRessource user)
        {
            var securityKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(_config["Jwt:Key"]));
            var credentials = new SigningCredentials(securityKey, SecurityAlgorithms.HmacSha512);
            
            var role = await _roleData.Get(user.IdRole);

            if (role == null)
                return null;

            Claim[] claims = new[]
            {
                new Claim("Id", user.Id.ToString()),
                new Claim(ClaimTypes.Name, user.Nom),
                new Claim(ClaimTypes.Email, user.Email),
                new Claim(ClaimTypes.Role, role.Nom)
            };

            var token = new JwtSecurityToken(
                _config["Jwt:Issuer"],
                _config["Jwt:Audience"],
                claims,
                expires: DateTime.Now.AddMinutes(30),
                signingCredentials: credentials
            );

            return new JwtSecurityTokenHandler().WriteToken(token);
        }

        private async Task<UsagerRessource?> Authenticate(UsagerLoginModel login)
        {
            var allUsers = await _usagersData.Get();
            var user = allUsers.Where(u => u.Email == login.Email && u.Password == login.Password).FirstOrDefault();

            if (user != null)
                return user;
            return null;
        }
    }
}
