using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _20T1020670.DomainModels
{
    /// <summary>
    /// Tài khoản người dùng
    /// </summary>
    public class UserAccount
    {
        /// <summary>
        /// Mã Tài Khoản
        /// </summary>
        public string UserId { get; set; }
        /// <summary>
        /// Tên Tài Khoản
        /// </summary>
        public string UserName { get; set; }
        /// <summary>
        /// Họ Tên đầy đủ tài khoản
        /// </summary>
        public string FullName { get; set; }
        /// <summary>
        /// Email
        /// </summary>
        public string Email { get; set; }
        /// <summary>
        /// Mật Khẩu
        /// </summary>
        public string Password { get; set; }
        /// <summary>
        /// Quyền truy cập tài khoản
        /// </summary>
        public string RoleNames { get; set; }
        /// <summary>
        /// Ảnh
        /// </summary>
        public string Photo { get; set; }
        /// <summary>
        /// Ghi Chú
        /// </summary>
        public string Notes { get; set; }
        /// <summary>
        /// Ngày Sinh 
        /// </summary>
        public DateTime BirthDate { get; set; }

    }
}
