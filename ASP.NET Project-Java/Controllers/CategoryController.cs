using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ASP.NET_Project_Java.Context;
using ASP.NET_Project_Java.Models;

namespace ASP.NET_Project_Java.Controllers
{
    public class CategoryController : Controller
    {
        Entities1 objEntities = new Entities1();
        public ActionResult AllCategory()
        {
            var lstCategory = objEntities.Categories.ToList();
            return View(lstCategory);
        }

        public ActionResult ProductCategory(int id, int page = 1, int minPrice = 10000, int maxPrice = 50000000)
        {
            int pageSize = 3;  // Số sản phẩm mỗi trang

            // Lấy sản phẩm thuộc danh mục và trong khoảng giá
            var listProduct = objEntities.Products
                                .Where(n => n.CategoryId == id && n.Price >= minPrice && n.Price <= maxPrice)
                                .OrderBy(p => p.Id)  // Sắp xếp sản phẩm (nếu cần)
                                .Skip((page - 1) * pageSize)  // Bỏ qua các sản phẩm trước trang hiện tại
                                .Take(pageSize)  // Lấy sản phẩm cho trang hiện tại
                                .ToList();

            // Tổng số sản phẩm trong khoảng giá
            var totalItems = objEntities.Products.Count(n => n.CategoryId == id && n.Price >= minPrice && n.Price <= maxPrice);
            var totalPages = (int)Math.Ceiling((double)totalItems / pageSize);  // Tính tổng số trang

            // Tạo ViewModel chứa thông tin phân trang
            var model = new ProductListViewModel
            {
                Products = listProduct,
                CurrentPage = page,
                TotalPages = totalPages,
                CategoryID = id
            };

            return View(model);
        }
    }
}