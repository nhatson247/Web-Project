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
    
    public class CategoryController : Controller
    {
        private const int PAGE_SIZE = 10;
        private const string CATEGORY_SEARCH = "SearchCategoryCondition";

        //// GET: Category
        //public ActionResult Index(int page = 1, int pageSize = 10, string searchValue = "")
        //{
        //    int rowCount = 0;
        //    var data = CommonDataService.ListOfCategories(page, pageSize, searchValue, out rowCount);

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
            PaginationSearchInput condition = Session[CATEGORY_SEARCH] as PaginationSearchInput;
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
            var data = CommonDataService.ListOfCategories(condition.Page, condition.PageSize, condition.SearchValue,
                out rowcount);
            var result = new CategorySearchOutput()
            {
                Page = condition.Page,
                PageSize = condition.PageSize,
                SearchValue = condition.SearchValue,
                RowCount = rowcount,
                Data = data
            };
            Session[CATEGORY_SEARCH] = condition;

            return View(result);
        }
        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        public ActionResult Create()
        {
            var data = new Category()
            {
                CategoryID = 0
            };

            ViewBag.Title = "Bổ sung Loại Hàng";
            return View("Edit", data);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]

        public ActionResult Save(Category data)
        {
            try
            {
                // kiểm soát đầu vào 
                if (string.IsNullOrWhiteSpace(data.CategoryName))
                    ModelState.AddModelError("CategoryName", "Tên không được để trống");
                ///
                if (string.IsNullOrWhiteSpace(data.Description))
                    ModelState.AddModelError("Description", "Mô tả không được để trống");
 
                //

                if (!ModelState.IsValid)
                {
                    ViewBag.Title = data.CategoryID == 0 ? "Bổ sung loại hàng" : "Cập nhập loại hàng";
                    return View("Edit", data);
                }
                if (data.CategoryID == 0)
                {
                    CommonDataService.AddCategory(data);
                }
                else
                {
                    CommonDataService.UpdateCategory(data);
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

            var data = CommonDataService.GetCategory(id);
            if (data == null)
                return RedirectToAction("index");

            ViewBag.Title = "Cập nhật Loại Hàng";
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
                var data = CommonDataService.GetCategory(id);
                if (data == null)
                    return RedirectToAction("index");
                return View(data);
            }
            else
            {
                CommonDataService.DeleteCategory(id);
                return RedirectToAction("Index");
            }
        }
    }
}