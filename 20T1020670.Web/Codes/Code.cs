using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace _20T1020670.Web
{
    /// <summary>
    /// 
    /// </summary>
    public class ApiResult
    {
        /// <summary>
        /// 0: thất bại, 1 thành công
        /// </summary>
        public int Code { get; set; }
        /// <summary>
        /// Thông báo lỗi nếu có
        /// </summary>
        public string Message { get; set; }
        /// <summary>
        /// 
        /// </summary>
        public object Data { get; set; }

        public static ApiResult Success(object data = null)
        {
            return new ApiResult { Code = 1, Message = "", Data = data };
        }

        public static ApiResult Fail(string msg)
        {
            return new ApiResult { Code = 0, Message = msg };

        }
    }
}