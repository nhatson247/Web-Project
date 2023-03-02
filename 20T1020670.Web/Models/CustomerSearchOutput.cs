using _20T1020670.DomainModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace _20T1020670.Web.Models
{
    /// <summary>
    /// Kết quả tìm kiếm khách hàng dưới dạng phân trang 
    /// </summary>
    public class CustomerSearchOutput : PaginationSearchOutput
    {
        /// <summary>
        /// Danh sách nhà khách hàng
        /// </summary>
        public List<Customer> Data { get; set; }
    }
}