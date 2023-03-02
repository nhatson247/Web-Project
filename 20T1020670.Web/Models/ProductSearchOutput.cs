using _20T1020670.DomainModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace _20T1020670.Web.Models
{
    /// <summary>
    /// Kết quả tìm kiếm người giao hàng dưới dạng phân trang 
    /// </summary>
    public class ProductSearchOutput : PaginationSearchOutput
    {
        /// <summary>
        /// Danh sách người giao hàng
        /// </summary>
        public List<Product> Data { get; set; }
        public int CategoryID { get; set; } = 0;
        public int SupplierID { get; set; } = 0;

    }
}