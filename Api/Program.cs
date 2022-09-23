using Infra.Dal.Implementations;
using Infra.Dal.Interfaces;

var builder = WebApplication.CreateBuilder(args);

var configuration = new ConfigurationBuilder()
    .AddJsonFile("appsettings.json", optional: false)
    .AddJsonFile("appsettings.Development.json", optional: true);

builder.Configuration.AddJsonFile("appsettings.json");

// configure our services
builder.Services
    .AddSingleton(configuration)
    .AddSingleton<IDatabase, MssqlDb>()
    .AddSingleton<IRolesData, RolesData>()
    .AddSingleton<IUsagersData, UsagersData>();

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

app.UseAuthorization();

app.MapControllers();

app.Run();
