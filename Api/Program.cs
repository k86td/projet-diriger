using Infra.Dal.Implementations;
using Infra.Dal.Interfaces;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.IdentityModel.Tokens;
using System.Text;

var builder = WebApplication.CreateBuilder(args);

var configuration = new ConfigurationBuilder()
    .AddJsonFile("appsettings.json", optional: false)
    .AddJsonFile("appsettings.Development.json", optional: true);

builder.Configuration.AddJsonFile("appsettings.json");

// configure authentication
builder.Services.AddAuthentication(JwtBearerDefaults.AuthenticationScheme)
    .AddJwtBearer( options =>
    {
        options.TokenValidationParameters = new TokenValidationParameters
        {
            ValidateIssuer = true,
            ValidateAudience = false,
            ValidateLifetime = true,
            ValidateIssuerSigningKey = true,
            ValidIssuer = builder.Configuration["Jwt:Issuer"],
            ValidAudience = builder.Configuration["Jwt:Audience"],
            IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(builder.Configuration["Jwt:Key"]))
        };
    });

builder.Services.AddCors(options =>
{
    options.AddPolicy("AllowEverywhere",
        policy =>
        {
            policy
                .AllowAnyMethod()
                .AllowAnyOrigin()
                .AllowAnyHeader();
        });
});

// configure our services
builder.Services
    .AddSingleton(configuration)
    .AddSingleton<IOffreData, OffreData>()
    .AddSingleton<ITypeOffreData, TypeOffreData>()
    .AddSingleton<ICategorieOffreData, CategorieOffreData>()
    .AddSingleton<IDatabase, MssqlDb>()
    .AddSingleton<IRolesData, RolesData>()
    .AddSingleton<IUsagersData, UsagersData>()
    .AddSingleton<IDemandesData, DemandesData>();

// Add services to the container.
builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}


app.UseHttpsRedirection();

app.UseCors("AllowEverywhere");

app.UseAuthentication();
app.UseAuthorization();

app.MapControllers();

app.Run();
