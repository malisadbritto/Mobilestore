using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Mobile_ShopProject
{
    public partial class WebForm6 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_contact_Click(object sender, EventArgs e)
        {
            if (txtName.Text=="")
            {
                lblerror.Text = "Name is required";
            }
            else if (txtEmail.Text=="")
            {
                lblerror.Text = "Email is required to contact you back";
            }
            else if (txtmobilename.Text == "")
            {
                lblerror.Text = "MobileName With Id  is required";
            }
            else if (txtissue.Text == "")
            {
                lblerror.Text = "Please Specify Issue so we can Solve";
            }

            else
            {
                txtName.Text = "";
                txtEmail.Text = "";
                txtmobilename.Text = "";
                txtissue.Text = "";
                txtPhone.Text = "";
                lblerror.Text = "";
                lblMessage.Text = "Sorry For The Issue  " +txtName.Text+ "*****.You will be Contacted shortly by our respresntative";
            }
        }

        protected void txtName_TextChanged(object sender, EventArgs e)
        {
            lblerror.Text = "";
        }

        protected void txtEmail_TextChanged(object sender, EventArgs e)
        {
            lblerror.Text = "";
        }

        protected void txtPhone_TextChanged(object sender, EventArgs e)
        {
            lblerror.Text = "";
        }

        protected void txtissue_TextChanged(object sender, EventArgs e)
        {
            lblerror.Text = "";
        }
    }
}