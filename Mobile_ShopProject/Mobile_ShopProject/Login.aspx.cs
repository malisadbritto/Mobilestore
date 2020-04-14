using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Mobile_ShopProject
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_Login_Click(object sender, EventArgs e)
        {

            DataSet ds = new DataSet();
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            try
            {
                conn.Open();
                string sqlstring = "select * from login_tbl where user_name='" + txtusername.Text + "' and password='"+txtpassword.Text+ "'";
                SqlDataAdapter da = new SqlDataAdapter(sqlstring, conn);
                da.Fill(ds);

               if (ds.Tables[0].Rows.Count>0)
                {
                    Session["UserName"] = txtusername.Text;
                    string role = ds.Tables[0].Rows[0]["role"].ToString();

                    if (role=="admin")
                    {
                        Response.Redirect("Add_new.aspx");

                    }
                    else
                    {
                        
                       //LinkButton lbl_UserName = this.Master.FindControl("linklogin") as LinkButton;
                       // lbl_UserName.Text = "Logout";
                        Response.Redirect("Home.aspx");
                    }
                    
                   
                }

               else
                {
                    lblerror.Text = "Incorrect Login Id Password.";
                }


            }

            catch (Exception ex)
            {
                lblerror.Text = "Some Error Ocurred.Contact Administrator for More details :  "+ex.Message;
            }
            conn.Close();

        }
    }
}