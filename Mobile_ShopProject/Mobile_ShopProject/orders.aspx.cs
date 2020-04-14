using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
namespace Mobile_ShopProject
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        string mobile_id;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // get the value from your hyperlink button
               mobile_id = Request.QueryString["mobile_id"];
                //string Price = Request.QueryString["Price"];
                

                DataSet ds = new DataSet();
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                try
                {
                    conn.Open();
                    string sqlstring = "select * from Mobile_description_tbl where mobile_id='"+ mobile_id + "'";
                    SqlDataAdapter da = new SqlDataAdapter(sqlstring, conn);
                    da.Fill(ds);

                    lblmobilename.Text = ds.Tables[0].Rows[0]["mobile_name"].ToString();
                    lblprice.Text = ds.Tables[0].Rows[0]["Price"].ToString();
                    img.ImageUrl = ds.Tables[0].Rows[0]["image_url"].ToString();
                    lblcamera.Text= ds.Tables[0].Rows[0]["Camera"].ToString();
                    lblCPU.Text = ds.Tables[0].Rows[0]["Cpu"].ToString();
                    lblversion.Text = ds.Tables[0].Rows[0]["version"].ToString();
                    lblram.Text = ds.Tables[0].Rows[0]["Ram"].ToString();

                }

                catch (Exception ex)
                {

                }
                conn.Close();
            }


        }

        

        protected void txtquantity_TextChanged(object sender, EventArgs e)
        {
            int i;
            try
            {
                lblerror.Text = "";
                if (Int32.TryParse(txtquantity.Text,out i))
                {
                    int quantity = Convert.ToInt32(txtquantity.Text);
                    if (quantity >0 && quantity <= 100)
                    {

                        int price = Convert.ToInt32(lblprice.Text);
                        lblamount.Text = (quantity * price).ToString();
                    }
                    else
                    {
                        lblerror.Text = "Quantity should be not less than 0 and more than 100.";
                    }
                }
                else
                {
                    lblerror.Text = "Quantity should be Numeric.";
                }

            }
            catch (Exception ex)
            {

            }
           
           
        }

        protected void btn_buynow_Click(object sender, EventArgs e)
        {
            Session["mobile_id"] = mobile_id;
            Response.Redirect("Cart.aspx?mobile_id="+mobile_id);
            
        }
    }
    }
