using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _20T1020670.DomainModels
{
    /// <summary>
    /// 
    /// </summary>
    public class Shipper 
    {
        /// <summary>
        /// Mã người giao hàng
        /// </summary>
        public int ShipperID { get; set; }
        /// <summary>
        /// Tên người giao hàng 
        /// </summary>
        public string ShipperName { get; set; }
        /// <summary>
        /// Số điện thoại 
        /// </summary>
        public string Phone { get; set; }
    }
}
