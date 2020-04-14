using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Mobile_ShopProject
{
    public partial class Checkout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)


            {

                try
                {

                    int amount = Convert.ToInt32(Request.QueryString["totalamount"].ToString());
                    int srno = Convert.ToInt32(Request.QueryString["srno"].ToString());
                    string date = DateTime.Now.AddDays(5).ToString();
                    lblproductnumber.Text = srno.ToString();
                    lblamount.Text = amount.ToString();
                    lbldate.Text = date;


                }
                catch(Exception ex)
                {

                }
            }
        }

        protected void btncontact_Click(object sender, EventArgs e)
        {
            Response.Redirect("contactus.aspx");
        }
    }
}