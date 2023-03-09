using _20T1020670.BusinessLayers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Xml.Linq;
using _20T1020670.DomainModels;
using _20T1020670.Web.Models;

namespace _20T1020670.Web.Controllers
{
    /// <summary>
    /// 
    /// </summary>
    [Authorize]
    [RoutePrefix("product")]
    public class ProductController : Controller
    {
        private const int PAGE_SIZE = 10;
        private const string PRODUCT_SEARCH = "SearchProductCondition";
        /// <summary>
        /// Tìm kiếm, hiển thị mặt hàng dưới dạng phân trang
        /// </summary>
        /// <returns></returns>
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
            int rowCount = 0;
            var data = ProductDataService.ListProducts(condition.Page,
                condition.PageSize,
                condition.SearchValue, condition.CategoryID, condition.SupplierID,
                out rowCount);
            var result = new ProductSearchOutput()
            {
                Page = condition.Page,
                PageSize = condition.PageSize,
                SearchValue = condition.SearchValue,
                CategoryID = condition.CategoryID,
                SupplierID = condition.SupplierID,
                RowCount = rowCount,
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
            return View(data);
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
                return RedirectToAction("Index");
            var product = ProductDataService.GetProduct(id);
            if (product == null)
                return RedirectToAction("Index");
            var data = new ProductModel()
            {
                ProductID = product.ProductID,
                ProductName = product.ProductName,
                CategoryID = product.CategoryID,
                SupplierID = product.SupplierID,
                Unit = product.Unit,
                Price = product.Price,
                Photo = product.Photo,
                Attributes = ProductDataService.ListAttributes(id),
                Photos = ProductDataService.ListPhotos(id)
            };
            if (data == null)
                return RedirectToAction("Index");
            return View(data);
        }
        /// <summary>
        /// Lưu mặt hàng
        /// </summary>
        /// <param name="data"></param>
        /// <param name="price"></param>
        /// <param name="uploadPhoto"></param>
        /// <returns></returns>
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Save(Product data, string price, HttpPostedFileBase uploadPhoto)
        {
            
            decimal? d = Converter.StringToDecimal(price);
            if (d == null)
                ModelState.AddModelError("Price", "Giá không hợp lệ");
            else
                data.Price = d.Value;
        
            if (string.IsNullOrWhiteSpace(data.ProductName))
                ModelState.AddModelError("ProductName", "Tên mặt hàng không được để trống");
            if (data.SupplierID == 0 )
                ModelState.AddModelError("SupplierID", "Vui lòng chọn nhà cung cấp");
            if (data.CategoryID == 0)
                ModelState.AddModelError("CategoryID", "Vui lòng chọn loại hàng");
            if (string.IsNullOrWhiteSpace(data.Unit))
                ModelState.AddModelError("Unit", "Đơn vị tính không được để trống");
            if (data.Price == 0)
                ModelState.AddModelError("Price", "Vui lòng nhập giá");

            var model = new ProductModel()
            {
                ProductID = data.ProductID,
                ProductName = data.ProductName,
                CategoryID = data.CategoryID,
                SupplierID = data.SupplierID,
                Unit = data.Unit,
                Price = data.Price,
                Photo = data.Photo,
                Attributes = ProductDataService.ListAttributes(data.ProductID),
                Photos = ProductDataService.ListPhotos(data.ProductID)
            };
            if (!ModelState.IsValid)
            {
                if (data.ProductID == 0)
                    return View("Create", data);
                else
                    return View("Edit", model);
            }
            if (string.IsNullOrWhiteSpace(data.Photo))
            {
                data.Photo = "";
            }

            if (uploadPhoto != null)
            {
                string path = Server.MapPath("~/Photo");
                string fileName = $"{DateTime.Now.Ticks}_{uploadPhoto.FileName}";
                string filePath = System.IO.Path.Combine(path, fileName);
                uploadPhoto.SaveAs(filePath);
                data.Photo = fileName;
            }
            else
            {
                ModelState.AddModelError("Photo", "Vui lòng chọn ảnh");
            }
            if (!ModelState.IsValid)
            {
                if (data.ProductID == 0)
                    return View("Create", data);
            }

            if (data.ProductID == 0)
            {
                ProductDataService.AddProduct(data);
            }
            else
                ProductDataService.UpdateProduct(data);
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
                return RedirectToAction("Index");

            if (Request.HttpMethod == "GET")
            {
                var data = ProductDataService.GetProduct(id);
                if (data == null)
                    return RedirectToAction("Index");
                return View(data);
            }
            else
            {
                if (ProductDataService.InUsedProduct(id))
                {
                    return Content("Khong the xoa!!");
                }
                else
                {
                    ProductDataService.DeleteProduct(id);
                    return RedirectToAction("Index");
                }
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
                    if (productID <= 0)
                    {
                        return RedirectToAction($"Edit/{productID}");
                    }
                    var data = new ProductPhoto()
                    {
                        PhotoID = 0,
                        ProductID = productID
                    };
                    ViewBag.Title = "Bổ sung ảnh";
                    return View(data);
                case "edit":
                    if (photoID == 0)
                        return RedirectToAction($"Edit/{productID}");

                    data = ProductDataService.GetPhoto(photoID);
                    if (data == null)
                        return RedirectToAction($"Edit/{productID}");
                    ViewBag.Title = "Thay đổi ảnh";
                    return View(data);
                case "delete":
                    ProductDataService.DeletePhoto(photoID);
                    return RedirectToAction($"Edit/{productID}"); 
                default:
                    return RedirectToAction($"Edit/{productID}");
            }
        }
        /// <summary>
        /// Lưu thư viện ảnh
        /// </summary>
        /// <param name="data"></param>
        /// <param name="uploadPhoto"></param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult SavePhoto(ProductPhoto data, HttpPostedFileBase uploadPhoto)
        {

            if (string.IsNullOrWhiteSpace(data.Photo))
                data.Photo = "";
            if (uploadPhoto != null)
            {
                string path = Server.MapPath("~/Photo");
                string fileName = $"{DateTime.Now.Ticks}_{uploadPhoto.FileName}";
                string filePath = System.IO.Path.Combine(path, fileName);
                uploadPhoto.SaveAs(filePath);
                data.Photo = fileName;
            }
            if(string.IsNullOrWhiteSpace(data.Photo))
            {
                ModelState.AddModelError("Photo", "Vui lòng chọn ảnh");
            }
            if (string.IsNullOrWhiteSpace(data.Description))
                ModelState.AddModelError("Description", "Giá trị thuộc tính không được để trống");
            if (data.DisplayOrder == 0)
                ModelState.AddModelError("DisplayOrder", "không được để trống");
            
            if (!ModelState.IsValid)
            {
                ViewBag.Title = data.PhotoID == 0 ? "Bổ sung ảnh" : "Cập nhật ảnh";
                return View("Photo", data);
            }
            if (data.PhotoID == 0)
            {
                ProductDataService.AddPhoto(data);
            }
            else
            {
                ProductDataService.UpdatePhoto(data);
            }
            return RedirectToAction($"Edit/{data.ProductID}");
     
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
                    if(productID <= 0)
                    {
                        return RedirectToAction($"Edit/{productID}");
                    }
                    var data = new ProductAttribute()
                    {
                        AttributeID = 0,
                        ProductID = productID
                    };
                    ViewBag.Title = "Bổ sung thuộc tính";
                    return View(data);
                case "edit":
                    if (attributeID == 0)
                        return RedirectToAction($"Edit/{productID}");

                    data = ProductDataService.GetAttribute(attributeID);
                    if (data == null)
                        return RedirectToAction($"Edit/{productID}");
                    ViewBag.Title = "Thay đổi thuộc tính";
                    return View(data);
                case "delete":
                    ProductDataService.DeleteAttribute(attributeID);
                    return RedirectToAction($"Edit/{productID}"); 

                default:
                    return RedirectToAction($"Edit/{productID}");
            }
        }

        /// <summary>
        /// Lưu thuộc tính
        /// </summary>
        /// <param name="data"></param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult SaveAttribute(ProductAttribute data)
        {
            
            if (string.IsNullOrWhiteSpace(data.AttributeName))
                ModelState.AddModelError("AttributeName", "Tên thuộc tính không được để trống");
            if (string.IsNullOrWhiteSpace(data.AttributeValue))
                ModelState.AddModelError("AttributeValue", "Giá trị thuộc tính không được để trống");
            if (data.DisplayOrder == 0)
                ModelState.AddModelError("DisplayOrder", "không được để trống");
            if (!ModelState.IsValid)
            {
                ViewBag.Title = data.AttributeID == 0 ? "Bổ sung thuộc tính" : "Cập nhật thuộc tính";
                return View("Attribute", data);
            }
            if (data.AttributeID == 0)
            {
                ProductDataService.AddAttribute(data);
            }
            else
            {
                ProductDataService.UpdateAttribute(data);
            }
            return RedirectToAction($"Edit/{data.ProductID}");
        
        }
    }
}