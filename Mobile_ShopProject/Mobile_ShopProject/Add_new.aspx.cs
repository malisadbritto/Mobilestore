using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

namespace Mobile_ShopProject.Category
{
    public partial class Add_new : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
       
        protected void Page_Load(object sender, EventArgs e)
        {
            string loggedUsername = Session["UserName"] as string;
            lbladminname.Text = loggedUsername;

        }

        

        //public void AddNewMobile()
        //{
        //    if (IsValid)
        //    {
               

        //        try
        //        {

        //            conn.Open();
        //            string insertQuery = "insert into Mobile_description_tbl(version,mobile_name,Cpu,Price,RAM,Camera,image_url,category_Id)values (@version,@mobile_name,@Cpu,@Price,@RAM,@Camera,@image_url,@category_Id)";
        //            SqlCommand cmd = new SqlCommand(insertQuery, conn);
        //            cmd.Parameters.AddWithValue("@version", txtversion.Text);
        //            cmd.Parameters.AddWithValue("@mobile_name", txtmobile.Text);
        //            cmd.Parameters.AddWithValue("@Cpu", txtcpu.Text);
        //            cmd.Parameters.AddWithValue("@Price", txtprice.Text);
        //            cmd.Parameters.AddWithValue("@RAM", txtram.Text);
        //            cmd.Parameters.AddWithValue("@Camera", txtcamera.Text);
        //            cmd.Parameters.AddWithValue("@image_url", txtdisplay.Text);
        //            cmd.Parameters.AddWithValue("@category_Id", ddlcategory.SelectedValue);

        //            cmd.ExecuteNonQuery();

        //            lblError.Text = "Mobile Added to category!!!thank you";

                   

        //        }
        //        catch (Exception ex)
        //        {
        //            lblError.Text = "A database error has occurred. " +
        //             "Message: " + ex.Message;
        //        }
        //        conn.Close();



        //    }
        //}

        //public void AddNewcategory()
        //{
        //    try
        //    {
        //        conn.Open();
        //        string query = "insert into category_table(category_name,category_added,admin_name) values (@name,@date,@admin_name)";
        //        SqlCommand cmd = new SqlCommand(query, conn);
        //        cmd.Parameters.AddWithValue("@name", txtCategory.Text);
        //        cmd.Parameters.AddWithValue("@date",Convert.ToDateTime(DateTime.Now.ToString("dd/MM/yyyy")));
        //        cmd.Parameters.AddWithValue("@admin_name",Session["Username"].ToString());
        //        cmd.ExecuteNonQuery();

        //    }
        //    catch(Exception ex)
        //    {

        //    }
        //    conn.Close();
        //}
        //protected void btn_add_Click(object sender, EventArgs e)
        //{
            
        //        AddNewMobile();
            
        //}

        //protected void Add_category_Click(object sender, EventArgs e)
        //{
        //    if (txtCategory.Text == "")
        //    {
        //        lblError.Text = "Category Name Should be not Empty";
        //    }
        //    else
        //    {
        //        AddNewcategory();
        //    }
        //}

        protected void grdcategory_PreRender(object sender, EventArgs e)
        {
            if (grdcategory.HeaderRow != null)
            {
                grdcategory.HeaderRow.TableSection = TableRowSection.TableHeader;
            }

        }

        protected void FormView1_ItemDeleted(object sender, FormViewDeletedEventArgs e)
        {
            if (e.Exception != null)
            {
                lblErrorMessage.Text = DatabaseErrorMessage(e.Exception.Message);
                e.ExceptionHandled = true;
            }
            else if (e.AffectedRows == 0)
                lblErrorMessage.Text = ConcurrencyErrorMessage();
            else
                grdcategory.DataBind();
        }

        private string DatabaseErrorMessage(string errorMsg)
        {
            return $"<b>A database error has occurred:</b> {errorMsg}";
        }
        private string ConcurrencyErrorMessage()
        {
            return "Another user may have updated that category. Please try again";
        }

        protected void FormView1_ItemDeleting(object sender, FormViewDeleteEventArgs e)
        {
            if (e.Values["Price"] != null)
                e.Values["Price"] = e.Values["Price"].ToString().Substring(1);
        }

        protected void FormView1_ItemInserted(object sender, FormViewInsertedEventArgs e)
        {
            if (e.Exception != null)
            {
                lblErrorMessage.Text = DatabaseErrorMessage(e.Exception.Message);
                e.ExceptionHandled = true;
            }
            else if (e.AffectedRows == 0)
                lblErrorMessage.Text = ConcurrencyErrorMessage();
            else
                grdcategory.DataBind();
        }

        protected void FormView1_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
        {


            if (e.Exception != null)
            {
                lblErrorMessage.Text = DatabaseErrorMessage(e.Exception.Message);
                e.ExceptionHandled = true;
                e.KeepInEditMode = true;
            }
            else if (e.AffectedRows == 0)
                lblErrorMessage.Text = ConcurrencyErrorMessage();
            else
                grdcategory.DataBind();
        }
    }
}