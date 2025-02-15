﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace ASP.NET_Project_Java.Models
{
    public class UserMasterData
    {
        [Required]
        public int Id { get; set; }
        [Required]

        public string UserName { get; set; }
        [Required]

        public string FirstName { get; set; }
        [Required]

        public string LastName { get; set; }
        [Required]

        public string Phone { get; set; }
        [Required]

        public string Password { get; set; }
        [Required]

        public string Email { get; set; }

        public Nullable<bool> IsAdmin { get; set; }

    }
}