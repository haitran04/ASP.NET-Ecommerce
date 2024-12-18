using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ASP.NET_Project_Java.Context;

namespace ASP.NET_Project_Java.Areas.Admin.Controllers
{
    public class ProductController : Controller
    {
        Entities1 objEntities = new Entities1();

        // GET: Admin/Product
        public ActionResult Index()
        {
            var lstProduct = objEntities.Products.ToList();
            return View(lstProduct);
        }
        [HttpGet]
        public ActionResult Create()
        {
            return View();
        }
    }
}