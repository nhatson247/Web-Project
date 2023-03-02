using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _20T1020670.DataLayers
{
    /// <summary>
    /// Định nghĩa các phép dữ liệu chung cho các dữ liệu
    /// đơn giản trên các bảng
    /// </summary>
   public interface ICommonDAL<T> where T: class
    {
        /// <summary>
        /// Tìm kiếm và lấy danh sách dưới dạng phân trang 
        /// </summary>
        /// <param name="page">trang cần hiển thị</param>
        /// <param name="pagesize">Số dòng hiển thị trên mỗi trang (0 tức là không yêu cầu phân trang)</param>
        /// <param name="searchvalue">Tên cần tìm kiếm (chuỗi rỗng nếu không tìm kiếm)</param>
        /// <returns></returns>
        IList<T> List(int page = 1, int pagesize = 0, string searchvalue = "");
        /// <summary>
        /// Đếm số  tìm được
        /// </summary>
        /// <param name="searchvalues">Tên cần tìm kiếm(chuỗi rỗng nếu không tìm kiếm theo tên)</param>
        /// <returns></returns>
        int Count(string searchvalues = "");
        /// <summary>
        /// Bổ sung thêm 
        /// </summary>
        /// <param name="data"></param>
        /// <returns>
        /// ID được tạo mới
        /// </returns>
        int Add(T data);
        /// <summary>
        /// Cập nhập thông tin 
        /// </summary>
        /// <param name="data"></param>
        /// <returns></returns>
        bool Update(T data);
        /// <summary>
        /// Xóa  dựa vào mã 
        /// </summary>
        /// <param name="Tid">Mã cấp cần xóa</param>
        /// <returns></returns>
        bool Delete(int id);
        /// <summary>
        /// Lấy thông tin  dựa vào mã 
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
       T Get(int id);
        /// <summary>
        /// Kiểm tra xem hiện có dữ liệu liên quan hay không 
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        bool InUsed(int id);

    }
}
