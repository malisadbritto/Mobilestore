using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Mobile_ShopProject.Category
{
    public partial class Android : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                DataSet ds = new DataSet();
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                try
                {
                    conn.Open();
                    string sqlstring = "select * from Mobile_description_tbl where category_Id=2";
                    SqlDataAdapter da = new SqlDataAdapter(sqlstring, conn);
                    da.Fill(ds);
                    GridView1.DataSource = ds;
                    GridView1.DataBind();
                }

                catch (Exception ex)
                {

                }
                conn.Close();
            }
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "buynow")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = GridView1.Rows[index];
                string quantity = (row.FindControl("ddlquantity") as DropDownList).SelectedValue;
                string mobilid = GridView1.Rows[index].Cells[1].Text;
                Response.Redirect("Cart.aspx?mobile_id=" + mobilid + "&quantity=" + quantity);
            }
        }
    }
}