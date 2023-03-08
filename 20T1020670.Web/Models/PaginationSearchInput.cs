using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace _20T1020670.Web.Models
{
    public class PaginationSearchInput
    {
        /// <summary>
        /// Trang được hiển thị
        /// </summary>
        public int Page { get; set; }
        /// <summary>
        /// Số dòng trên mỗi trang
        /// </summary>
        public int PageSize { get; set; }
        /// <summary>
        /// Giá trị tìm kiếm 
        /// </summary>
        public string SearchValue { get; set; }
        /// <summary>
        /// Số dòng tìm được 
        /// </summary>
        /// 
        
    }
    /// <summary>
    /// Mặt hàng tìm được
    /// </summary>
    public class ProductSearchInput : PaginationSearchInput
    {
        /// <summary>
        ///  Mã loại hàng tìm đc
        /// </summary>
        public int CategoryID { get; set; } = 0;
        /// <summary>
        /// Nhà cung cấp tìm được
        /// </summary>
        public int SupplierID { get; set; } = 0;

    }
    /// <summary>
    /// 
    /// </summary>
    public class OrderSearchInput : PaginationSearchInput
    {
        /// <summary>
        /// Mã nhân viên tìm được
        /// </summary>
        public int EmployeeID { get; set; } = 0;
        /// <summary>
        /// Mã người giao hàng tìm được
        /// </summary>
        public int ShipperID { get; set; } = 0;
        /// <summary>
        /// trạng thái tìm được
        /// </summary>
        public int Status { get; set; } = 0;
    }
}