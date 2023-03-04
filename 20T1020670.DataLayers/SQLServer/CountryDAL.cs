using _20T1020670.DomainModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;
using _20T1020670.DataLayers.SQLServer;

namespace _20T1020670.DataLayers.SQLServer
{
    /// <summary>
    /// cài đặt xử lý dữ liệu liên quan đến quốc gia
    /// </summary>
    public class CountryDAL : _BaseDAL, ICountryDAL
    {
        /// <summary>
        /// Ctor
        /// </summary>
        /// <param name="connectionString"></param>
        public CountryDAL(string connectionString) : base(connectionString)
        {

        }
        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        public IList<Country> List()
        {
            List<Country> data = new List<Country>();
            using(var connection = OpenConnection())
            {
                SqlCommand cmd = connection.CreateCommand();
                cmd.CommandText = "SELECT CountryName FROM Countries";
                cmd.CommandType = CommandType.Text;

                SqlDataReader dbReader = cmd.ExecuteReader(CommandBehavior.CloseConnection); 
                while (dbReader.Read())
                {
                    data.Add(new Country(){
                    CountryName = Convert.ToString(dbReader["CountryName"])
                    });
                }
                dbReader.Close();
                connection.Close();
            }
            return data;
        }
    }
}
