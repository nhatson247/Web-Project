using _20T1020670.BusinessLayers;
using _20T1020670.DomainModels;
using _20T1020670.Web.Models;
using Microsoft.Ajax.Utilities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using static _20T1020670.Web.Models.PaginationSearchInput;

namespace _20T1020670.Web.Controllers
{
    /// <summary>
    /// 
    /// </summary>
    [Authorize]
    [RoutePrefix("product")]
    public class ProductController : Controller
    {
        /// <summary>
        /// Tìm kiếm, hiển thị mặt hàng dưới dạng phân trang
        /// </summary>
        /// <returns></returns>
        /// 
        private const int PAGE_SIZE = 10;
        private const string PRODUCT_SEARCH = "SearchProductCondition";
        public ActionResult Index()
        {
            ProductSearchInput condition = Session[PRODUCT_SEARCH] as ProductSearchInput;
            if (condition == null)
            {
                condition = new ProductSearchInput()
                {
                    CategoryID = 0,
                    SupplierID = 0,
                    Page = 1,
                    PageSize = PAGE_SIZE,
                    SearchValue = ""
                };
            }
            return View(condition);
        }

        public ActionResult Search(ProductSearchInput condition)
        {
            int rowcount = 0;
            var data = ProductDataService.ListProducts(condition.Page, condition.PageSize, condition.SearchValue, condition.CategoryID, condition.SupplierID,
                out rowcount);
            var result = new ProductSearchOutput()
            {
                CategoryID = condition.CategoryID,
                SupplierID = condition.SupplierID,
                Page = condition.Page,
                PageSize = condition.PageSize,
                SearchValue = condition.SearchValue,
                RowCount = rowcount,
                Data = data
            };
            Session[PRODUCT_SEARCH] = condition;

            return View(result);
        }

        /// <summary>
        /// Tạo mặt hàng mới
        /// </summary>
        /// <returns></returns>
        public ActionResult Create()
        {
            var data = new Product()
            {
                ProductID = 0
            };

            ViewBag.Title = "Bổ sung Mặt Hàng";
            return View("Create", data);
        }

        /// <summary>
        /// Cập nhật thông tin mặt hàng, 
        /// Hiển thị danh sách ảnh và thuộc tính của mặt hàng, điều hướng đến các chức năng
        /// quản lý ảnh và thuộc tính của mặt hàng
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>        
        public ActionResult Edit(int id = 0)
        {
            if (id == 0)
                /// cách cho null 
                ///return Content("id bằng 0");
                return RedirectToAction("index");

            var data = ProductDataService.GetProduct(id);
            var photo = ProductDataService.GetPhoto(id);
            var attribute = ProductDataService.GetAttribute(id);
            var model = new ProductModel
            {

            };


            if (model == null)
                return RedirectToAction("index");

            ViewBag.Title = "Cập nhật Mặt hàng";
            return View(model);
        }


        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Save(Product data, HttpPostedFileBase uploadPhoto)
        {
            

            // kiểm soát đầu vào 
            if (string.IsNullOrWhiteSpace(data.ProductName))
                ModelState.AddModelError("ProductName", "Tên mặt hàng không được để trống");
            ///
            if (string.IsNullOrWhiteSpace(data.CategoryID.ToString()))
                ModelState.AddModelError("CategoryID", "Loại hàng không được để trống");
            ///
            if (string.IsNullOrWhiteSpace(data.SupplierID.ToString()))
                ModelState.AddModelError("SupplierID", "Nhà cung cấp không được để trống");
            ///
            if (string.IsNullOrWhiteSpace(data.Unit))
                ModelState.AddModelError("Unit", "Đơn vị tính không được để trống");
            ///
            if (string.IsNullOrWhiteSpace(data.Price.ToString()))
                ModelState.AddModelError("Price", "Price không được để trống");
            ///
            if (string.IsNullOrWhiteSpace(data.Photo))
                data.Photo = "";
            ///


            //
            if (!ModelState.IsValid)
            {
                ViewBag.Title = data.ProductID == 0 ? "Bổ sung Mặt Hàng" : "Cập nhập Mặt Hàng";
                return View("Create", data);
            }

            if (uploadPhoto != null)
            {
                string path = Server.MapPath("~/Photo");
                string fileName = $"{DateTime.Now.Ticks}_{uploadPhoto.FileName}";
                string filePath = System.IO.Path.Combine(path, fileName);
                uploadPhoto.SaveAs(filePath);
                data.Photo = fileName;
            }


            if (data.ProductID == 0)
            {
                ProductDataService.AddProduct(data);
            }
            else
            {
                ProductDataService.UpdateProduct(data);
            }
            return RedirectToAction("Index");
        }
        /// <summary>
        /// Xóa mặt hàng
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>        
        public ActionResult Delete(int id = 0)
        {
            if (id == 0)
                /// cách cho null 
                ///return Content("id bằng 0");
                return RedirectToAction("index");


            if (Request.HttpMethod == "GET")
            {
                var data = ProductDataService.GetProduct(id);
                if (data == null)
                    return RedirectToAction("index");
                return View(data);
            }
            else
            {
                ProductDataService.DeleteProduct(id);
                return RedirectToAction("Index");
            }
        }

        /// <summary>
        /// Các chức năng quản lý ảnh của mặt hàng
        /// </summary>
        /// <param name="method"></param>
        /// <param name="productID"></param>
        /// <param name="photoID"></param>
        /// <returns></returns>
        [Route("photo/{method?}/{productID?}/{photoID?}")]
        public ActionResult Photo(string method = "add", int productID = 0, long photoID = 0)
        {
            switch (method)
            {
                case "add":
                    ViewBag.Title = "Bổ sung ảnh";
                    return View();
                case "edit":
                    ViewBag.Title = "Thay đổi ảnh";
                    return View();
                case "delete":
                    //ProductDataService.DeletePhoto(photoID);
                    return RedirectToAction($"Edit/{productID}"); //return RedirectToAction("Edit", new { productID = productID });
                default:
                    return RedirectToAction("Index");
            }
        }

        /// <summary>
        /// Các chức năng quản lý thuộc tính của mặt hàng
        /// </summary>
        /// <param name="method"></param>
        /// <param name="productID"></param>
        /// <param name="attributeID"></param>
        /// <returns></returns>
        [Route("attribute/{method?}/{productID}/{attributeID?}")]
        public ActionResult Attribute(string method = "add", int productID = 0, long attributeID = 0)
        {
            switch (method)
            {
                case "add":
                    ViewBag.Title = "Bổ sung thuộc tính";
                    return View();
                case "edit":
                    ViewBag.Title = "Thay đổi thuộc tính";
                    return View();
                case "delete":
                    //ProductDataService.DeleteAttribute(attributeID);
                    return RedirectToAction($"Edit/{productID}"); //return RedirectToAction("Edit", new { productID = productID });
                default:
                    return RedirectToAction("Index");
            }
        }
    }
}