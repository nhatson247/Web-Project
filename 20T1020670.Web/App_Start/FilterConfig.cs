using System.Web;
using System.Web.Mvc;

namespace _20T1020670.Web
{
    /// <summary>
    /// log và hiển thị lỗi
    /// </summary>
    public class FilterConfig
    {
        /// <summary>
        /// 
        /// </summary>
        /// <param name="filters"></param>
        public static void RegisterGlobalFilters(GlobalFilterCollection filters)
        {
            filters.Add(new HandleErrorAttribute());
        }
    }
}
