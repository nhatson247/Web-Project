using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using _20T1020670.DomainModels;

namespace _20T1020670.DataLayers
{
    /// <summary>
    /// các chức năng xử lý dữ liệu cho quốc gia
    /// </summary>
     public interface ICountryDAL
    {
        /// <summary>
        /// lấy danh sách các quốc gia
        /// </summary>
        /// <returns></returns>
        IList<Country> List();
    }
}
