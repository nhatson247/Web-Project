using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _20T1020670.DomainModels
{
    /// <summary>
    /// Ảnh của mặt hàng
    /// </summary>
    public class ProductPhoto
    {
        ///<summary>
        ///Mã Hình ảnh
        ///</summary>
        public long PhotoID { get; set; }
        ///<summary>
        /// Mã sản phẩm
        ///</summary>
        public int ProductID { get; set; }
        ///<summary>
        /// Ảnh của mặt hàng
        ///</summary>
        public string Photo { get; set; }
        ///<summary>
        /// Mô tả ảnh
        ///</summary>
        public string Description { get; set; }
        ///<summary>
        ///Thứ tự hiển thị ảnh
        ///</summary>
        public int DisplayOrder { get; set; }
        ///<summary>
        /// ẩn ảnh
        ///</summary>
        public bool IsHidden { get; set; }
    }

}
