using _20T1020670.BusinessLayers;
using _20T1020670.DomainModels;
using _20T1020670.Web.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace _20T1020670.Web.Controllers
{
    /// <summary>
    /// 
    /// </summary>
    [Authorize]

    public class ShipperController : Controller
    {
        /// <summary>
        /// 
        /// </summary>
        private const int PAGE_SIZE = 5;
        private const string SHIPPER_SEARCH = "SearchShipperCondition";

        // GET: Shipper
        //public ActionResult Index(int page = 1, int pageSize = 5, string searchValue = "")
        //{
        //    int rowCount = 0;
        //    var data = CommonDataService.ListOfShippers(page, pageSize, searchValue, out rowCount);

        //    int pageCount = rowCount / pageSize;
        //    if (rowCount % pageSize > 0)
        //        pageCount += 1;


        //    ViewBag.Page = page;
        //    ViewBag.PageCount = pageCount;
        //    ViewBag.RowCount = rowCount;
        //    ViewBag.PageSize = pageSize;
        //    ViewBag.SearchValue = searchValue;

        //    return View(data);
        //}
        public ActionResult Index()
        {
            PaginationSearchInput condition = Session[SHIPPER_SEARCH] as PaginationSearchInput;
            if (condition == null)
            {
                condition = new PaginationSearchInput()
                {
                    Page = 1,
                    PageSize = PAGE_SIZE,
                    SearchValue = ""
                };
            }
            return View(condition);
        }
        public ActionResult Search(PaginationSearchInput condition)
        {
            int rowcount = 0;
            var data = CommonDataService.ListOfShippers(condition.Page, condition.PageSize, condition.SearchValue,
                out rowcount);
            var result = new ShipperSearchOutput()
            {
                Page = condition.Page,
                PageSize = condition.PageSize,
                SearchValue = condition.SearchValue,
                RowCount = rowcount,
                Data = data
            };
            Session[SHIPPER_SEARCH] = condition;

            return View(result);
        }
        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        public ActionResult Create()
        {
            var data = new Shipper()
            {
                ShipperID = 0
            };

            ViewBag.Title = "Bổ sung người Giao Hàng";
            return View("Edit", data);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]

        public ActionResult Save(Shipper data)
        {
            try
            {
                if (string.IsNullOrWhiteSpace(data.ShipperName))
                    ModelState.AddModelError("ShipperName", "Tên không được để trống");
                ///
                if (string.IsNullOrWhiteSpace(data.Phone))
                    ModelState.AddModelError("Phone", "Số điện thoại không được để trống");
                if (!ModelState.IsValid)
                {
                    ViewBag.Title = data.ShipperID == 0 ? "Bổ sung nguời giao hàng" : "Cập nhập người giao hàng";
                    return View("Edit", data);
                }
                if (data.ShipperID == 0)
                {
                    CommonDataService.AddShipper(data);
                }
                else
                {
                    CommonDataService.UpdateShipper(data);
                }
                return RedirectToAction("Index");
            }
            catch
            {
                // ghi lại log lỗi 
                return Content("Có lỗi xảy ra, vui lòng thử lại sau!");
            }
           
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

            var data = CommonDataService.GetShipper(id);

            if (data == null)
                return RedirectToAction("index");

            ViewBag.Title = "Cập nhật người Giao Hàng";
            return View(data);
        }
        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        public ActionResult Delete(int id = 0)
        {
            if (id == 0)
                /// cách cho null 
                ///return Content("id bằng 0");
                return RedirectToAction("index");


            if (Request.HttpMethod == "GET")
            {
                var data = CommonDataService.GetShipper(id);
                if (data == null)
                    return RedirectToAction("index");
                return View(data);
            }
            else
            {
                CommonDataService.DeleteShipper(id);
                return RedirectToAction("Index");
            }
        }
    }
}
