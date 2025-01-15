using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.UI;
using ASP.NET_Project_Java.Context;
using PagedList;

using static ASP.NET_Project_Java.Common;

namespace ASP.NET_Project_Java.Areas.Admin.Controllers
{
    public class BrandController : Controller
    {
        Entities1 objEntities = new Entities1();
        // GET: Admin/Brand
        public ActionResult Index(string searchTerm, int? page)
        {
            // Get all products as IQueryable
            var lstBrand = objEntities.Brands.AsQueryable();

            // Search functionality
            if (!string.IsNullOrEmpty(searchTerm))
            {
                lstBrand = lstBrand.Where(p => p.Name.Contains(searchTerm));
            }

            ViewBag.CurrentFilter = searchTerm;

            // Pagination settings
            int pageSize = 10;
            int pageNumber = page ?? 1;

            // Ensure you call ToPagedList() on the IQueryable to get IPagedList
            var pagedList = lstBrand.OrderBy(p => p.Name).ToPagedList(pageNumber, pageSize);

            return View(pagedList);  // Return IPagedList<Product> to the view
        }
        public ActionResult Details(int Id)
        {
            var objBrand = objEntities.Brands.Where(n => n.Id == Id).FirstOrDefault();
            return View(objBrand);
        }

        [HttpGet]
        public ActionResult Delete(int Id)
        {
            var objBrand = objEntities.Brands.Where(n => n.Id == Id).FirstOrDefault();
            return View(objBrand);
        }

        [HttpPost]
        public ActionResult Delete(Brand objBra)
        {
            var objBrand = objEntities.Brands.Where(n => n.Id == objBra.Id).FirstOrDefault();

            objEntities.Brands.Remove(objBrand);
            objEntities.SaveChanges();

            return RedirectToAction("Index");
        }

        [HttpGet]
        public ActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Create(Brand objBrand)
        {
            try
            {
                if (objBrand.ImageUpload != null)
                {
                    string fileName = Path.GetFileNameWithoutExtension(objBrand.ImageUpload.FileName);
                    string extension = Path.GetExtension(objBrand.ImageUpload.FileName);
                    fileName = fileName + extension;
                    objBrand.Image = fileName;
                    objBrand.ImageUpload.SaveAs(Path.Combine(Server.MapPath("~/Content/images/brand/"), fileName));
                }

                objEntities.Brands.Add(objBrand);
                objEntities.SaveChanges();

                return RedirectToAction("Index");
            }
            catch (Exception)
            {
                return RedirectToAction("Index");
            }
        }

        // GET: Admin/Product
        [HttpGet]
        public ActionResult Edit(int? id)
        {
            if (id == null) return HttpNotFound();

            var brand = objEntities.Brands.Find(id);
            if (brand == null) return HttpNotFound();

            return View(brand);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(Brand objBrand)
        {
            try
            {
                var existingBrand = objEntities.Brands.Find(objBrand.Id);
                if (existingBrand == null)
                {
                    return HttpNotFound();
                }

                // Kiểm tra và xử lý tệp tải lên
                if (objBrand.ImageUpload != null && objBrand.ImageUpload.ContentLength > 0)
                {
                    // Xử lý ảnh
                    string fileName = Path.GetFileNameWithoutExtension(objBrand.ImageUpload.FileName);
                    string extension = Path.GetExtension(objBrand.ImageUpload.FileName);
                    fileName = fileName + extension; // Thêm timestamp để tránh trùng tên
                    string filePath = Path.Combine(Server.MapPath("~/Content/images/brand/"), fileName);

                    objBrand.ImageUpload.SaveAs(filePath);

                    // Xóa ảnh cũ nếu có
                    if (!string.IsNullOrEmpty(existingBrand.Image))
                    {
                        string oldFilePath = Path.Combine(Server.MapPath("~/Content/images/brand/"), existingBrand.Image);
                        if (System.IO.File.Exists(oldFilePath))
                        {
                            System.IO.File.Delete(oldFilePath);
                        }
                    }

                    // Cập nhật đường dẫn ảnh mới
                    existingBrand.Image = fileName;
                }

                // Cập nhật các trường khác
                existingBrand.Name = objBrand.Name;
                existingBrand.Slug = objBrand.Slug;
                existingBrand.DisplayOrder = objBrand.DisplayOrder;
                existingBrand.ShowOnHomePage = objBrand.ShowOnHomePage;
                existingBrand.Deleted = objBrand.Deleted;

                // Đánh dấu thực thể là đã chỉnh sửa
                objEntities.Entry(existingBrand).State = EntityState.Modified;

                // Lưu thay đổi vào cơ sở dữ liệu
                objEntities.SaveChanges();

                TempData["SuccessMessage"] = "Cập nhật sản phẩm thành công!";
                return RedirectToAction("Index");
            }
            catch (Exception ex)
            {
                // Log lỗi nếu cần thiết (sử dụng thư viện log như NLog hoặc Serilog)
                TempData["ErrorMessage"] = "Đã xảy ra lỗi trong quá trình cập nhật sản phẩm. Vui lòng thử lại.";
                return RedirectToAction("Edit", new { id = objBrand.Id });
            }
        }

    }
}