using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Mobile_ShopProject
{
    public partial class WebForm5 : System.Web.UI.Page
    {
       
        protected void Page_Load(object sender, EventArgs e)
        {
            
            
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            if (!IsPostBack)
            {
                lblemptyCart.Text = "";
                DataSet ds = new DataSet();
                DataTable dt = new DataTable();
                DataRow dr;
                dt.Columns.Add("srno");
                dt.Columns.Add("mobile_id");
                dt.Columns.Add("mobile_name");
                dt.Columns.Add("price");
                dt.Columns.Add("quantity");
                dt.Columns.Add("totalprice");
                dt.Columns.Add("productimage");
                if (Request.QueryString["mobile_id"] != null)
                {
                    if (Session["BuyItems"] == null)
                    {
                        dr = dt.NewRow();

                        try
                        {
                            lblemptyCart.Text = "";
                            conn.Open();
                            string sqlstring = "select * from Mobile_description_tbl where mobile_id='" + Request.QueryString["mobile_id"] + "'";
                            SqlDataAdapter da = new SqlDataAdapter(sqlstring, conn);
                            da.Fill(ds);
                            dr["srno"] = 1;
                            dr["mobile_id"] = ds.Tables[0].Rows[0]["mobile_id"].ToString();
                            dr["mobile_name"] = ds.Tables[0].Rows[0]["mobile_name"].ToString();
                            dr["productimage"] = ds.Tables[0].Rows[0]["image_url"].ToString();
                            dr["price"] = ds.Tables[0].Rows[0]["Price"].ToString();
                            dr["quantity"] = Request.QueryString["quantity"];
                            int price = Convert.ToInt32(ds.Tables[0].Rows[0]["Price"].ToString());
                            int quantity = Convert.ToInt32(Request.QueryString["quantity"].ToString());
                            int totalprice = price * quantity;
                            dr["totalprice"] = totalprice;
                            dt.Rows.Add(dr);
                            GridView1.DataSource = dt;
                            GridView1.DataBind();
                            Session["BuyItems"] = dt;
                            GridView1.FooterRow.Cells[5].Text = "Total Amount";
                            GridView1.FooterRow.Cells[6].Text = grandtotal().ToString();
                            Response.Redirect("Cart.aspx");


                        }

                        catch (Exception ex)
                        {
                            lblemptyCart.Text = "Error Occured:" + ex.Message;
                        }
                        conn.Close();
                    }

                    else
                    {
                        lblemptyCart.Text = "";
                        dt = (DataTable)Session["BuyItems"];
                        int sr;
                        sr = dt.Rows.Count;
                        dr = dt.NewRow();
                        conn.Open();
                        string query = "select * from Mobile_description_tbl where mobile_id='" + Request.QueryString["mobile_id"] + "'";
                        SqlCommand cmd = new SqlCommand();
                        SqlDataAdapter da = new SqlDataAdapter(query, conn);
                        DataSet ds1 = new DataSet();
                        da.Fill(ds1);
                        dr["srno"] = sr + 1;
                        dr["mobile_id"] = ds1.Tables[0].Rows[0]["mobile_id"].ToString();
                        dr["mobile_name"] = ds1.Tables[0].Rows[0]["mobile_name"].ToString();
                        dr["productimage"] = ds1.Tables[0].Rows[0]["image_url"].ToString();
                        dr["price"] = ds1.Tables[0].Rows[0]["Price"].ToString();
                        dr["quantity"] = Request.QueryString["quantity"];
                        int price = Convert.ToInt32(ds1.Tables[0].Rows[0]["Price"].ToString());
                        int quantity = Convert.ToInt32(Request.QueryString["quantity"].ToString());
                        int totalprice = price * quantity;
                        dr["totalprice"] = totalprice;
                        dt.Rows.Add(dr);
                        GridView1.DataSource = dt;
                        GridView1.DataBind();
                        Session["BuyItems"] = dt;
                        GridView1.FooterRow.Cells[5].Text = "Total Amount";
                        GridView1.FooterRow.Cells[6].Text = grandtotal().ToString();
                        Response.Redirect("Cart.aspx");



                    }
                }
                else
                {
                    lblemptyCart.Text = "";
                    dt = (DataTable)Session["BuyItems"];
                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                    if (GridView1.Rows.Count >=1)

                    {
                        GridView1.FooterRow.Cells[5].Text = "Total Amount";
                        GridView1.FooterRow.Cells[6].Text = grandtotal().ToString();
                    }
                    else
                    {
                        lblemptyCart.Text = "Your Cart Is Empty.";
                    }
                }
            }

        }

        public int grandtotal()
        {
            DataTable dt = new DataTable();
            dt = (DataTable)Session["BuyItems"];
            int nrow = dt.Rows.Count;
            int i = 0;
            int gtotal = 0;
            while (i < nrow)
            {
                gtotal = gtotal + Convert.ToInt32(dt.Rows[i]["totalprice"].ToString());
                i = i + 1;
            }
            return gtotal;
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            DataTable dt = new DataTable();
            dt = (DataTable)Session["BuyItems"];
            dt.Rows.RemoveAt(e.RowIndex);          
            GridView1.DataSource = dt;
            GridView1.DataBind();
            GridView1.FooterRow.Cells[5].Text = "Total Amount";
            GridView1.FooterRow.Cells[6].Text = grandtotal().ToString();
        }

        protected void btn_checkout_Click(object sender, EventArgs e)
        {
            lblemptyCart.Text = "";
            int totalprice=0;
            int srno = 0;
            try
            {
                foreach (GridViewRow gr in GridView1.Rows)
                {
                    totalprice += Convert.ToInt32(GridView1.Rows[gr.RowIndex].Cells[6].Text);
                    srno = srno + 1;

                }
                //int amount = totalprice;
                //int serialno = srno;
                Response.Redirect("Checkout.aspx?totalamount=" + totalprice + "&srno=" + srno);
            }
            catch(Exception ex)
            {
                lblemptyCart.Text = "Error Occured:" + ex.Message;
            }
        }

        protected void btn_back_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx");
           
                //string prvurl = (string)ViewState["url"];
                //string Apple = "Apple";
                //if (prvurl.Contains(Apple))
                //{
                //    Response.Redirect("Apple.aspx");
                //}

                //else
                //{
                //    Response.Redirect("Android.aspx");
                //}

            
           
            
        }
    }
}