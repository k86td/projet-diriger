using Infra.Dal.Interfaces;
using Dapper;
using System.Data.SqlClient;
using Microsoft.Extensions.Configuration;

namespace Infra.Dal.Implementations
{
    public class MssqlDb : IDatabase
    {
        private readonly string _connectionString;

        public MssqlDb( IConfiguration config, string? connectionStringName = "Default" )
        {
            _connectionString = config.GetConnectionString( connectionStringName );
        }

        public async Task<int> ExecuteFromSP<P>(string storedProcedures, P parameters)
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                int affectedRows = await connection.ExecuteAsync(
                        storedProcedures, 
                        param: parameters, 
                        commandType: System.Data.CommandType.StoredProcedure
                    );

                return affectedRows;
            }
        }

        public async  Task<int> ExecuteFromSql<P>(string sql, P parameters)
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                int affectedRows = await connection.ExecuteAsync(
                        sql,
                        param: parameters,
                        commandType: System.Data.CommandType.Text
                    );

                return affectedRows;
            }
        }

        public async Task<List<T>> QueryFromSP<T, P>(string storedProcedures, P parameters)
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                var result = await connection.QueryAsync<T>(
                        storedProcedures,
                        param: parameters,
                        commandType: System.Data.CommandType.StoredProcedure
                    );

                return result.ToList();
            }
        }

        public async Task<List<T>> QueryFromSql<T, P>(string sql, P parameters)
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                var result = await connection.QueryAsync<T>(
                        sql,
                        param: parameters,
                        commandType: System.Data.CommandType.Text
                    );

                return result.ToList();
            }
        }
    }
}
