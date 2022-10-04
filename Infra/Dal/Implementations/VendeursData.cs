using Infra.Dal.Interfaces;
using Infra.Ressources;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Infra.Dal.Implementations
{
    public class VendeursData : IVendeursData
    {
        private readonly IDatabase _db;
        public VendeursData(IDatabase db)
        {
            _db = db;
        }

        public async Task<int> Create(VendeurRessource entity)
        {
            // TODO implement returning id on creation
            await _db.ExecuteFromSP("dbo.AddVendeur", new
            {
                entity.IdUsager,
            });
            return 0;
        }

        public async Task Delete(int id)
        {
            await _db.ExecuteFromSP("dbo.DeleteVendeur", new { id });
        }

        public async Task Edit(int id, VendeurRessource modification)
        {
            await _db.ExecuteFromSP("dbo.EditVendeur", new { id, modification.DateAccepter });
        }
        public async Task<ICollection<VendeurRessource>> Get()
        {
            return await _db.QueryFromSP<VendeurRessource, dynamic>("dbo.GetAllVendeurs", new { });
        }

        public async Task<VendeurRessource?> Get(int id)
        {
            var sellers = await Get();
            var selectedSeller = sellers.Where(s => s.IdUsager == id).FirstOrDefault();

            if (selectedSeller == null)
            {
                return null;
            }

            return selectedSeller;
        }

    }
}
