using _20T1020670.DomainModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace _20T1020670.Web.Models
{
    public class OrderModel : Order
    {
        /// <summary>
        /// 
        /// </summary>
        public List<OrderDetail> OrderDetails { get; set; }


    }
}