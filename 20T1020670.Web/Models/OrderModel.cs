using _20T1020670.DomainModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace _20T1020670.Web.Models
{
    /// <summary>
    /// tổng hợp của đơn hàng
    /// </summary>
    public class OrderModel : Order
    {
        /// <summary>
        /// Danh sách chi tiết hóa đơn
        /// </summary>
        public List<OrderDetail> OrderDetails { get; set; }


    }
}