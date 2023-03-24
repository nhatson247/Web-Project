using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using System.Web.Services.Description;
using System.Web.UI;
using _20T1020670.BusinessLayers;

namespace _20T1020670.Web.Controllers
{
    /// <summary>
    /// 
    /// </summary>
    [Authorize]
    public class AccountController : Controller
    {
        // GET: Account
        public ActionResult Index()
        {
            return View();
        }
        [HttpGet]
        [AllowAnonymous]
        public ActionResult Login()
        {
            var employeeCookie = Converter.CookieToUserAccount(User.Identity.Name);
            if(employeeCookie != null) return RedirectToAction("Index", "Home");
            return View();
        }
        public ActionResult ChangePassword()
        {
            var userAccount = Converter.CookieToUserAccount(User.Identity.Name);
            ViewBag.UserName = userAccount.UserName;
            return View();

        }

        [ValidateAntiForgeryToken]
        [AllowAnonymous]
        [HttpPost]
        public ActionResult Login(string userName = "", string password = "")
        {
            if (Request.HttpMethod == "GET")
            {
                return View();
            }
            ViewBag.UserName = userName;
            if (string.IsNullOrWhiteSpace(userName) || string.IsNullOrWhiteSpace(password))
            {
                ModelState.AddModelError("", "Vui lòng nhập đủ thông tin");
                return View();
            }
            var userAccount = UserAccountService.Authorize(AccountTypes.Employee, userName, password);
            if (userAccount == null)
            {
                ModelState.AddModelError("", "Đăng nhập thất bại");
                return View();
            }
            string cookieValue = Newtonsoft.Json.JsonConvert.SerializeObject(userAccount);
            FormsAuthentication.SetAuthCookie(cookieValue, false);
            return RedirectToAction("Index", "Home");
        }
        /// <summary>
        /// log out
        /// </summary>
        /// <returns></returns>
        public ActionResult Logout()
        {
            Session.Clear();
            FormsAuthentication.SignOut();
            return RedirectToAction("Login");
        }

        [HttpPost]
        public ActionResult ChangePassword(string userName = "", string oldPassword = "", string newPassword = "")
        {
            ViewBag.UserName = userName;
                if (string.IsNullOrWhiteSpace(oldPassword) || string.IsNullOrWhiteSpace(newPassword))
            {
                ModelState.AddModelError("", "Vui lòng nhập đủ thông tin");
                return View();
            }
            var check = UserAccountService.ChangePassword(AccountTypes.Employee, userName, oldPassword, newPassword);
            if (check == false)
            {
                ModelState.AddModelError("", "Mật khẩu cũ không đúng");
                return View();
            }
            FormsAuthentication.SignOut();
            return RedirectToAction("Logout");
        }

    }
}
