using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ASP.NET_Project_Java.Context;
using PagedList;

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

        public ActionResult AllProduct(string currentFilter, string SearchString, int? page)
        {
            var lstProduct = new List<Product>();
            if (SearchString != null)
            {
                page = 1;
            }
            else
            {
                SearchString = currentFilter;
            }
            if (!string.IsNullOrEmpty(SearchString))
            {
                lstProduct = objEntities.Products.Where(n => n.Name.Contains(SearchString)).ToList();
            }
            else
            {
                lstProduct = objEntities.Products.ToList();
            }
            ViewBag.CurentFIlter = SearchString;
            int pageSize = 8;
            int pageNumber = (page ?? 1);
            lstProduct = lstProduct.OrderByDescending(n => n.Id).ToList();
            return View(lstProduct.ToPagedList(pageNumber, pageSize));
        }
    }
}