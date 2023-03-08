using _20T1020670.DomainModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace _20T1020670.Web.Models
{
    /// <summary>
    /// Kết quả tìm kiếm người mặt hàng dưới dạng phân trang 
    /// </summary>
    public class ProductSearchOutput : PaginationSearchOutput
    {
        /// <summary>
        /// Danh sách mặt hàng
        /// </summary>
        public List<Product> Data { get; set; }
        /// <summary>
        /// Mã loại hàng
        /// </summary>
        public int CategoryID { get; set; } = 0;
        /// <summary>
        /// Mã nhà cung cấp
        /// </summary>
        public int SupplierID { get; set; } = 0;

    }
}