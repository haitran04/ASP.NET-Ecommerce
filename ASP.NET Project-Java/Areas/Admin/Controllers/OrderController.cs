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
    public class OrderController : Controller
    {
        // GET: Admin/Order
        Entities1 objEntities = new Entities1();

        // GET: Admin/Product
        public ActionResult Index(string searchTerm, int? page)
        {
            // Get all products as IQueryable
            var lstOrder = objEntities.Orders.AsQueryable();

            // Search functionality
            if (!string.IsNullOrEmpty(searchTerm))
            {
                lstOrder = lstOrder.Where(p => p.Name.Contains(searchTerm));
            }

            ViewBag.CurrentFilter = searchTerm;

            // Pagination settings
            int pageSize = 10;
            int pageNumber = page ?? 1;

            // Ensure you call ToPagedList() on the IQueryable to get IPagedList
            var pagedList = lstOrder.OrderBy(p => p.Name).ToPagedList(pageNumber, pageSize);

            return View(pagedList);  // Return IPagedList<Product> to the view
        }
        public ActionResult Details(int Id)
        {
            var objOrder = objEntities.Orders.Where(n => n.Id == Id).FirstOrDefault();
            return View(objOrder);
        }

        [HttpGet]
        public ActionResult Delete(int Id)
        {
            var objOrder = objEntities.Orders.Where(n => n.Id == Id).FirstOrDefault();
            return View(objOrder);
        }

        [HttpPost]
        public ActionResult Delete(Order objOrde)
        {
            var objOrder = objEntities.Orders.Where(n => n.Id == objOrde.Id).FirstOrDefault();

            objEntities.Orders.Remove(objOrder);
            objEntities.SaveChanges();

            return RedirectToAction("Index");
        }

        [HttpGet]
        public ActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Create(Order objOrder)
        {
            try
            {
                // Thêm người dùng vào cơ sở dữ liệu
                objEntities.Orders.Add(objOrder);
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

            var order = objEntities.Orders.Find(id);
            if (order == null) return HttpNotFound();

            return View(order);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(Order objOrder)
        {
            try
            {
                var existingOrder = objEntities.Orders.Find(objOrder.Id);
                if (existingOrder == null)
                {
                    return HttpNotFound();
                }

                // Cập nhật các trường khác
                existingOrder.Name = objOrder.Name;
                existingOrder.UserId = objOrder.UserId;
                existingOrder.Status = objOrder.Status;
                existingOrder.CreatedOnUtc = objOrder.CreatedOnUtc;

                // Đánh dấu thực thể là đã chỉnh sửa
                objEntities.Entry(existingOrder).State = EntityState.Modified;

                // Lưu thay đổi vào cơ sở dữ liệu
                objEntities.SaveChanges();

                TempData["SuccessMessage"] = "Cập nhật sản phẩm thành công!";
                return RedirectToAction("Index");
            }
            catch (Exception ex)
            {
                // Log lỗi nếu cần thiết (sử dụng thư viện log như NLog hoặc Serilog)
                TempData["ErrorMessage"] = "Đã xảy ra lỗi trong quá trình cập nhật sản phẩm. Vui lòng thử lại.";
                return RedirectToAction("Edit", new { id = objOrder.Id });
            }
        }
    }
}