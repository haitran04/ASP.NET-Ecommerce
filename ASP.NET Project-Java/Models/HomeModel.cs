using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using ASP.NET_Project_Java.Context;

namespace ASP.NET_Project_Java.Models
{
    public class HomeModel
    {
        public List<Product> ListProduct { get; set; }
        public List<Category> ListCategory { get; set; }

    }
}