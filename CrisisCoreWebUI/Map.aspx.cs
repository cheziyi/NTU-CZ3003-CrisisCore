﻿using CrisisCoreModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CrisisCoreWebUI
{
    public partial class Map : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Account account = (Account)(Session["account"]);
            if (account != null)
            {
                if (account.AccessLevel < 1)
                {
                    Response.Redirect("~/Login.aspx");
                }
            }
        }
    }
}