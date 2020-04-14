using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Mobile_ShopProject
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "addtocart")
            {
                DropDownList ddqquantitylist = (DropDownList)(e.Item.FindControl("ddlquantity"));
                Response.Redirect("Cart.aspx?mobile_id=" + e.CommandArgument.ToString() + "&quantity=" + ddqquantitylist.SelectedItem.ToString());
            }
        }
    }
}