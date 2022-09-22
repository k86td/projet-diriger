

namespace Infra.Dal.Interfaces
{
    public interface IDatabase
    {
        public Task<List<T>> QueryFromSP<T, P>(string storedProcedures, P parameters);
        public Task<int> ExecuteFromSP<P>(string storedProcedures, P parameters);
        public Task<List<T>> QueryFromSql<T, P>(string sql, P parameters);
        public Task<int> ExecuteFromSql<P>(string sql, P parameters);
    }
}
