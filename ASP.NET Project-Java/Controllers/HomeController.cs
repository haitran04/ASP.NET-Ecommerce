using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ASP.NET_Project_Java.Context;
using ASP.NET_Project_Java.Models;

namespace ASP.NET_Project_Java.Controllers
{
    public class HomeController : Controller
    {
        Entities1 objEntities = new Entities1();

        public ActionResult Index()
        {
            HomeModel objHomeModel = new HomeModel();
            objHomeModel.ListCategory = objEntities.Categories.ToList();
            objHomeModel.ListProduct = objEntities.Products.ToList();
            return View(objHomeModel);
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";
            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";
            return View();
        }
    }
}