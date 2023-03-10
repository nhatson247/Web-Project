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

    public class CustomerController : Controller
    {
        /// <summary>
        /// 
        /// </summary>
        private const int PAGE_SIZE = 10;
        private const string CUSTOMER_SEARCH = "SearchCustomerCondition";
     
        // GET: Customer
        //public ActionResult Index(int page = 1, int pageSize = 10, string searchValue = "")
        //{
        //    int rowCount = 0;
        //    var data = CommonDataService.ListOfCustomers(page, pageSize, searchValue, out rowCount);

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

        /// <summary>
        /// tìm kiếm, phân trang khách hàng
        /// </summary>
        /// <returns></returns>
        public ActionResult Index()
        {
            PaginationSearchInput condition = Session[CUSTOMER_SEARCH] as PaginationSearchInput;
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
            var data = CommonDataService.ListOfCustomers(condition.Page, condition.PageSize, condition.SearchValue,
                out rowcount);
            var result = new CustomerSearchOutput()
            {
                Page = condition.Page,
                PageSize = condition.PageSize,
                SearchValue = condition.SearchValue,
                RowCount = rowcount,
                Data = data
            };
            Session[CUSTOMER_SEARCH] = condition;

            return View(result);
        }
        /// <summary>
        /// Bổ sung Khách Hàng
        /// </summary>
        /// <returns></returns>
        public ActionResult Create()
        {
            var data = new Customer()
            {
                CustomerID = 0
            };

            ViewBag.Title = "Bổ sung Khách Hàng";
            return View("Edit", data);
        }
        /// <summary>
        /// lưu thông tin khách hàng
        /// </summary>
        /// <param name="data"></param>
        /// <returns></returns>
        [HttpPost]
        [ValidateAntiForgeryToken]

        public ActionResult Save(Customer data)
        {
            try {
                // kiểm soát đầu vào 
                if (string.IsNullOrWhiteSpace(data.CustomerName))
                    ModelState.AddModelError("CustomerName", "Tên không được để trống");
                ///
                if (string.IsNullOrWhiteSpace(data.ContactName))
                    ModelState.AddModelError("ContactName", "Tên giao dịch không được để trống");
                ///
                if (string.IsNullOrWhiteSpace(data.Country))
                    ModelState.AddModelError("Country", "Vui lòng chọn quốc gia");
                ///
                if (string.IsNullOrWhiteSpace(data.City))
                    ModelState.AddModelError("City", "Thành phố không được để trống");
                ///
                if (string.IsNullOrWhiteSpace(data.Address))
                    ModelState.AddModelError("Address", "Địa chỉ không được để trống");
                ///
                if (string.IsNullOrWhiteSpace(data.PostalCode))
                    ModelState.AddModelError("PostalCode", "Mã bưu chính không được để trống");
                ///
                if (string.IsNullOrWhiteSpace(data.Email))
                    ModelState.AddModelError("Email", "*");
                ///
                if (!ModelState.IsValid)
                {
                    ViewBag.Title = data.CustomerID == 0 ? "Bổ sung khách hàng" : "Cập nhập nhà khách hàng";
                    return View("Edit", data);
                }
                ///

                if (data.CustomerID == 0)
                {
                    CommonDataService.AddCustomer(data);
                }
                else
                {
                    CommonDataService.UpdateCustomer(data);
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
        /// chỉnh sửa thông tin khách hàng
        /// </summary>
        /// <returns></returns>
        public ActionResult Edit(int id = 0)
        {
            if (id == 0)
                /// cách cho null 
                ///return Content("id bằng 0");
                return RedirectToAction("index");

            var data = CommonDataService.GetCustomer(id);
            if (data == null)
                return RedirectToAction("index");

            ViewBag.Title = "Cập nhật Khách Hàng";
            return View(data);
        }
        /// <summary>
        /// xóa khách hàng
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
                var data = CommonDataService.GetCustomer(id);
                if (data == null)
                    return RedirectToAction("index");
                return View(data);
            }
            else
            {
                CommonDataService.DeleteCustomer(id);
                return RedirectToAction("Index");
            }
        }
    }
}