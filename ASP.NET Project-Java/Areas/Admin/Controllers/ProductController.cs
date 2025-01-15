using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ASP.NET_Project_Java.Context;
using PagedList;

using static ASP.NET_Project_Java.Common;

namespace ASP.NET_Project_Java.Areas.Admin.Controllers
{
    public class ProductController : Controller
    {
        Entities1 objEntities = new Entities1();
        // GET: Admin/Product
        public ActionResult Index(string searchTerm, int? page)
        {
            // Get all products as IQueryable
            var lstProduct = objEntities.Products.AsQueryable();

            // Search functionality
            if (!string.IsNullOrEmpty(searchTerm))
            {
                lstProduct = lstProduct.Where(p => p.Name.Contains(searchTerm));
            }

            ViewBag.CurrentFilter = searchTerm;

            // Pagination settings
            int pageSize = 10;
            int pageNumber = page ?? 1;

            // Ensure you call ToPagedList() on the IQueryable to get IPagedList
            var pagedList = lstProduct.OrderBy(p => p.Name).ToPagedList(pageNumber, pageSize);

            return View(pagedList);  // Return IPagedList<Product> to the view
        }
        public ActionResult Details(int Id)
        {
            var objProduct = objEntities.Products.Where(n => n.Id == Id).FirstOrDefault();
            return View(objProduct);
        }

        [HttpGet]
        public ActionResult Create()
        {
            // Lấy danh sách danh mục và thương hiệu từ cơ sở dữ liệu
            var categories = objEntities.Categories.ToList();
            ViewBag.CategoryId = new SelectList(categories, "Id", "Name");

            var brands = objEntities.Brands.ToList();
            ViewBag.BrandId = new SelectList(brands, "Id", "Name");

            return View();
        }

        [HttpPost]
        public ActionResult Create(Product objProduct)
        {
            try
            {
                if (objProduct.ImageUpload != null)
                {
                    string fileName = Path.GetFileNameWithoutExtension(objProduct.ImageUpload.FileName);
                    string extension = Path.GetExtension(objProduct.ImageUpload.FileName);
                    fileName = fileName + extension;
                    objProduct.Image = fileName;
                    objProduct.ImageUpload.SaveAs(Path.Combine(Server.MapPath("~/Content/images/items/"), fileName));
                }

                objEntities.Products.Add(objProduct);
                objEntities.SaveChanges();

                return RedirectToAction("Index");
            }
            catch (Exception)
            {
                return RedirectToAction("Index");
            }
        }

        [HttpGet]
        public ActionResult Delete(int Id)
        {
            var objProduct = objEntities.Products.Where(n => n.Id == Id).FirstOrDefault();
            return View(objProduct);
        }

        [HttpPost]
        public ActionResult Delete(Product objPro)
        {
            var objProduct = objEntities.Products.Where(n => n.Id == objPro.Id).FirstOrDefault();

            objEntities.Products.Remove(objProduct);
            objEntities.SaveChanges();

            return RedirectToAction("Index");
        }

        // GET: Admin/Product
        [HttpGet]
        public ActionResult Edit(int? id)
        {
            if (id == null) return HttpNotFound();

            var product = objEntities.Products.Find(id);
            if (product == null) return HttpNotFound();

            // Truyền danh sách Category và Brand vào ViewBag
            ViewBag.CategoryId = new SelectList(objEntities.Categories, "Id", "Name", product.CategoryId);
            ViewBag.BrandId = new SelectList(objEntities.Brands, "Id", "Name", product.BrandId);

            return View(product);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(Product objProduct)
        {
            try
            {
                var existingProduct = objEntities.Products.Find(objProduct.Id);
                if (existingProduct == null)
                {
                    return HttpNotFound();
                }

                // Kiểm tra và xử lý tệp tải lên
                if (objProduct.ImageUpload != null && objProduct.ImageUpload.ContentLength > 0)
                {
                    // Xử lý ảnh
                    string fileName = Path.GetFileNameWithoutExtension(objProduct.ImageUpload.FileName);
                    string extension = Path.GetExtension(objProduct.ImageUpload.FileName);
                    fileName = fileName + extension; // Thêm timestamp để tránh trùng tên
                    string filePath = Path.Combine(Server.MapPath("~/Content/images/items/"), fileName);

                    objProduct.ImageUpload.SaveAs(filePath);

                    // Xóa ảnh cũ nếu có
                    if (!string.IsNullOrEmpty(existingProduct.Image))
                    {
                        string oldFilePath = Path.Combine(Server.MapPath("~/Content/images/items/"), existingProduct.Image);
                        if (System.IO.File.Exists(oldFilePath))
                        {
                            System.IO.File.Delete(oldFilePath);
                        }
                    }

                    // Cập nhật đường dẫn ảnh mới
                    existingProduct.Image = fileName;
                }

                // Cập nhật các trường khác
                existingProduct.Name = objProduct.Name;
                existingProduct.ShortDes = objProduct.ShortDes;
                existingProduct.FullDescription = objProduct.FullDescription;
                existingProduct.Price = objProduct.Price;
                existingProduct.PriceDiscount = objProduct.PriceDiscount;
                existingProduct.CategoryId = objProduct.CategoryId;
                existingProduct.BrandId = objProduct.BrandId;
                existingProduct.DisplayOrder = objProduct.DisplayOrder;
                existingProduct.ShowOnHomePage = objProduct.ShowOnHomePage;
                existingProduct.Deleted = objProduct.Deleted;

                // Đánh dấu thực thể là đã chỉnh sửa
                objEntities.Entry(existingProduct).State = EntityState.Modified;

                // Lưu thay đổi vào cơ sở dữ liệu
                objEntities.SaveChanges();

                TempData["SuccessMessage"] = "Cập nhật sản phẩm thành công!";
                return RedirectToAction("Index");
            }
            catch (Exception ex)
            {
                // Log lỗi nếu cần thiết (sử dụng thư viện log như NLog hoặc Serilog)
                TempData["ErrorMessage"] = "Đã xảy ra lỗi trong quá trình cập nhật sản phẩm. Vui lòng thử lại.";
                return RedirectToAction("Edit", new { id = objProduct.Id });
            }
        }
    }
}