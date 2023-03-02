using _20T1020670.BusinessLayers;
using _20T1020670.DomainModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;


namespace _20T1020670.Web.Controllers
{
    /// <summary>
    /// 
    /// </summary>


    [Authorize]
    public class ProfileController: Controller
    {
        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        public ActionResult Index()
        {
            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Save(Employee data, string birthday, HttpPostedFileBase uploadPhoto)
        {
            //try
            //{
            DateTime? d = Converter.DMYStringToDateTime(birthday);
            if (d == null)
                ModelState.AddModelError("BirthDate", $"Ngày {birthday} không hợp lệ. Vui lòng nhập theo định dạng dd/MM/yyyy");
            else
                data.BirthDate = d.Value;
            // kiểm soát đầu vào 
            if (string.IsNullOrWhiteSpace(data.LastName))
                ModelState.AddModelError("LastName", "Họ đệm không được để trống");
            ///
            if (string.IsNullOrWhiteSpace(data.FirstName))
                ModelState.AddModelError("FirstName", "Tên không được để trống");
            ///
            if (string.IsNullOrWhiteSpace(data.BirthDate.ToLongDateString()))
                ModelState.AddModelError("BirthDate", "Ngày sinh không được để trống");
            ///
            if (string.IsNullOrWhiteSpace(data.Photo))
                data.Photo = "";
            ///
            if (string.IsNullOrWhiteSpace(data.Email))
                ModelState.AddModelError("Email", "Email không được để trống");

            //
            if (!ModelState.IsValid)
            {
                ViewBag.Title = data.EmployeeID == 0 ? "Bổ sung nhân viên" : "Cập nhập nhân viên";
                return View("Edit", data);
            }

            if (uploadPhoto != null)
            {
                string path = Server.MapPath("~/Photo");
                string fileName = $"{DateTime.Now.Ticks}_{uploadPhoto.FileName}";
                string filePath = System.IO.Path.Combine(path, fileName);
                uploadPhoto.SaveAs(filePath);
                data.Photo = fileName;
            }


            if (data.EmployeeID == 0)
            {
                CommonDataService.AddEmployee(data);
            }
            else
            {
                CommonDataService.UpdateEmployee(data);
            }
            return RedirectToAction("Index");
            //}
            //catch
            //{
            //    // ghi lại log lỗi 
            //    return Content("Có lỗi xảy ra, vui lòng thử lại sau!");
            //}

        }
        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        public ActionResult Edit(int id = 0)
        {
            if (id == 0)
                /// cách cho null 
                ///return Content("id bằng 0");
                return RedirectToAction("index");

            var data = CommonDataService.GetEmployee(id);

            if (data == null)
                return RedirectToAction("index");

            ViewBag.Title = "Cập nhật Tài Khoản";
            return View(data);
        }


    }

}
