using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ASP.NET_Project_Java.Context;

namespace ASP.NET_Project_Java.Controllers
{
    public class UserController : Controller
    {
        Entities1 objEntities = new Entities1();

        public ActionResult Login()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Login(string username, string password)
        {
            if (username == "user" && password == "123")
            {
                Session["UserName"] = username.ToString();
                Session["Password"] = password.ToString();
                return RedirectToAction("Index","Home");
            }
            else
            {
                return Login();
            }
        }
        [HttpGet]
        public ActionResult Register()
        {
            return View();
        }
    }
}