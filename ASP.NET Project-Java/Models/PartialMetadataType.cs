﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace ASP.NET_Project_Java.Models
{
    [MetadataType(typeof(UserMasterData))]
    public partial class User
    {

    }

    //[MetadataType(typeof(ProductMasterData))]
    //public partial class Product
    //{
    //    [NotMapped]
    //    public System.Web.HttpPostedFileBase ImageUpload { get; set; }
    //}
}