using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ASP.NET_Project_Java.Context;

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

        public ActionResult ProductCategory(int Id)
        {
            var listProduct = objEntities.Products.Where(n => n.CategoryId == Id).ToList();
            return View(listProduct);
        }
    }
}