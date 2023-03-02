using _20T1020670.DomainModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace _20T1020670.Web.Models
{
    /// <summary>
    /// Kết quả tìm kiếm nhân viên dưới dạng phân trang 
    /// </summary>
    public class EmployeeSearchOutput : PaginationSearchOutput
    {

        /// <summary>
        /// Danh sách Nhân viên
        /// </summary>
        public List<Employee> Data { get; set; }
    }
}
