using _20T1020670.DomainModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace _20T1020670.Web.Models
{
    /// <summary>
    /// Kết quả của đơn hàng dưới dạng phân trang
    /// </summary>
    public class OrderSearchOutput : PaginationSearchOutput
    {
        /// <summary>
        /// KQ của Danh sách đơn hàng
        /// </summary>
        public List<Order> Data { get; set; }
        /// <summary>
        /// KQ mã nhân viên của đơn hàng
        /// </summary>
        public int EmployeeID { get; set; } = 0;
        /// <summary>
        /// KQ người giao hàng của đơn hàng
        /// </summary>
        public int ShipperID { get; set; } = 0;
        /// <summary>
        /// KQ trạng thái của đơn hàng
        /// </summary>
        public int Status { get; set; } = 0;


    }
}