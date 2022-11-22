using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Infra.Dal.Interfaces;
using Infra.Ressources;
using Dapper;

namespace Infra.Dal.Implementations
{
    public class OffreData : IOffreData
    {
        private readonly IDatabase _db;

        public OffreData(IDatabase db)
        {
            _db = db;
        }

        public async Task<int> Create(OffreRessource entity)
        {
            DynamicParameters param = new();
            param.Add("Nom", entity.Nom);
            param.Add("IdVendeur", entity.IdVendeur, System.Data.DbType.Int64);
            param.Add("Prix", entity.Prix, System.Data.DbType.Currency);
            param.Add("Coordonner", entity.Coordonner);
            param.Add("IdCategorieOffre", entity.IdCategorieOffre, System.Data.DbType.Int64);
            param.Add("IdTypeOffre", entity.IdTypeOffre, System.Data.DbType.Int32);
            param.Add("OffreId", dbType: System.Data.DbType.Int32, direction: System.Data.ParameterDirection.Output);
            param.Add("DateDebut", entity.DateDebut, System.Data.DbType.DateTime2);
            param.Add("DateFin", entity.DateFin, System.Data.DbType.DateTime2);
            param.Add("Image", entity.Image, System.Data.DbType.String);

            await _db.ExecuteFromSP("dbo.AddOffre", param);

            return param.Get<int>("OffreId");
        }

        public async Task Delete(int id)
        {
            await _db.ExecuteFromSql("DELETE FROM dbo.Offres WHERE Id = @Id",
                new
                {
                    Id = id
                });
        }

        public async Task Edit(int id, OffreRessource modification)
        {
            await _db.ExecuteFromSql("UPDATE dbo.Offres SET Nom = @Nom, Prix = @Prix, Coordonner = @Coordonner, IdTypeOffre = @IdTypeOffre, IdCategorieOffre = @IdCategorieOffre, dateDebut = @DateDebut, dateFin = @DateFin, image = @Image WHERE Id = @Id",
                new
                {
                    modification.Nom,
                    modification.Prix,
                    modification.Coordonner,
                    modification.IdTypeOffre,
                    modification.IdCategorieOffre,
                    modification.DateDebut,
                    modification.DateFin,
                    modification.Image,
                    Id = id
                });
        }

        public async Task<ICollection<OffreRessource>> Get()
        {
            return await _db.QueryFromSql<OffreRessource, dynamic?>("SELECT * FROM dbo.Offres", null);
        }

        public async Task<OffreRessource?> Get(int id)
        {
            var offres = await _db.QueryFromSql<OffreRessource, dynamic>("SELECT * FROM dbo.Offres WHERE Id = @Id",
                new
                {
                    Id = id
                });
            return offres.FirstOrDefault();
        }
        
        public async Task<ICollection<OffreRessource>> GetOffresBySellerId(int id)
        {
            var offres = await _db.QueryFromSP<OffreRessource, dynamic>("GetOffresBySellerId",
                    new
                    {
                        Id = id
                    });
            return offres;
        }
    }
}
