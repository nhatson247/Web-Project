using _20T1020670.DomainModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace _20T1020670.Web.Models
{
    /// <summary>
    /// Kết quả của Mặt hàng có kế thừa 
    /// </summary>
    public class ProductModel : Product
    {
        /// <summary>
        /// KQ danh sách thuộc tính
        /// </summary>
        public List<ProductAttribute>  Attributes { get; set; }
        /// <summary>
        /// KQ danh sách ảnh của mặt hàng
        /// </summary>
        public List<ProductPhoto>  Photos { get; set;  }
    }
}