using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ASP.NET_Project_Java.Context;

namespace ASP.NET_Project_Java.Controllers
{
    public class ProductController : Controller
    {
        Entities1 objEntities = new Entities1();

        public ActionResult Detail(int Id)
        {
            var objProduct = objEntities.Products.Where(n=>n.Id == Id).FirstOrDefault();
            return View(objProduct);
        }
    }
}