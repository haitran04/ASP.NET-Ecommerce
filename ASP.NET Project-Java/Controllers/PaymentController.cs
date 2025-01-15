using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ASP.NET_Project_Java.Context;
using ASP.NET_Project_Java.Models;

namespace ASP.NET_Project_Java.Controllers
{
    public class PaymentController : Controller
    {
        // GET: Payment
        Entities1 objEntities = new Entities1();

        public ActionResult Index()
        {
            if (Session["idUser"] == null)
            {
                return RedirectToAction("Login", "User");
            }
            else
            {
                // lấy thông tin từ giỏ hàng trong session
                var istCart = (List<CartModel>)Session["cart"];

                // tạo dữ liệu cho Order
                Order objOrder = new Order();
                objOrder.Name = "DonHang-" + DateTime.Now.ToString("yyyyMMddHHmmss");
                objOrder.UserId = int.Parse(Session["idUser"].ToString());
                objOrder.CreatedOnUtc = DateTime.Now;
                objOrder.Status = 17;

                objEntities.Orders.Add(objOrder);

                // lưu thông tin vào bảng Order
                objEntities.SaveChanges();

                // Lấy OrderId vừa tạo để lưu vào bảng OrderDetail
                int orderId = objOrder.Id;
                List<OrderDetail> lstOrderDetail = new List<OrderDetail>();

                foreach (var item in istCart)
                {
                    OrderDetail obj = new OrderDetail();
                    obj.Quantity = item.Quantity;
                    obj.OrderId = orderId;
                    obj.ProductId = item.Product.Id;
                    lstOrderDetail.Add(obj);
                }

                objEntities.OrderDetails.AddRange(lstOrderDetail);
                objEntities.SaveChanges();
                Session["cart"] = null;
            }

            return View();
        }
    }
}