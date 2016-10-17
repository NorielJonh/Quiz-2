using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;
using System.IO;
public partial class Admin_Products_Details : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["ID"] != null) // query string is existing
        {
            int productID = 0; // initial value
            bool validProductID = int.TryParse(Request.QueryString["ID"].ToString(), out productID);

            if (validProductID)
            {
                if (!IsPostBack)
                {
                    GetData(productID);
                    GetCategories();
                }
            }
            else
            {
                Response.Redirect("Default.aspx");
            }
        }
        else // query string is not existing
        {
            Response.Redirect("Default.aspx");
        }
    }

    void GetCategories()
    {
        using (SqlConnection con = new SqlConnection(Util.GetConnection()))
        {
            con.Open();
            string SQL = @"SELECT CatID, Category From Categories";

            using (SqlCommand cmd = new SqlCommand(SQL, con))
            {
                using (SqlDataReader dr = cmd.ExecuteReader())
                {
                    ddlCategory.DataSource = dr;
                    ddlCategory.DataTextField = "Category";
                    ddlCategory.DataValueField = "CatID";
                    ddlCategory.DataBind();

                    ddlCategory.Items.Insert(0, new ListItem("Select one...", ""));
                }
            }
        }
    }
    void GetData(int ID)
    {
        using (SqlConnection con = new SqlConnection(Util.GetConnection()))
        {
            con.Open();
            string SQL = @"SELECT ProductID, Name, CatID, Code, Description, Image, 
                           Price, IsFeatured, Criticallevel, Maximum 
                           FROM Products WHERE ProductID = @ProductID";

            using (SqlCommand cmd = new SqlCommand(SQL, con))
            {
                cmd.Parameters.AddWithValue("@ProductID", ID);

                using (SqlDataReader dr = cmd.ExecuteReader())
                {
                    if (dr.HasRows) //record existing
                    {
                        while (dr.Read())
                        {
                            ltID.Text = ID.ToString();
                            ltID2.Text = ID.ToString();
                            txtName.Text = dr["Name"].ToString();
                            ddlCategory.SelectedValue = dr["CatID"].ToString();
                            txtCode.Text = dr["Code"].ToString();
                            txtDescription.Text = dr["Description"].ToString();
                            Session["image"] = dr["Image"].ToString();
                            txtPrice.Text = dr["Price"].ToString();
                            ddlIsFeatured.SelectedValue = dr["IsFeatured"].ToString();
                            txtCriticallevel.Text = dr["Criticallevel"].ToString();
                            txtMaximum.Text = dr["Maximum"].ToString();
                        }
                    }
                    else //record is not existing
                    {
                        Response.Redirect("Default.aspx");
                    }
                }
            }
        }
    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection(Util.GetConnection()))
        {
            con.Open();
            string SQL = @"UPDATE Products SET Name = @Name, CatID = @CatID, Code = @Code, Description = @Description,
                           Image = @Image, Price = @Price, IsFeatured = @IsFeatured, Available = @Available,
                           Criticallevel = @Criticallevel, Maximum = @Maximum, 
                           DateModified = @DateModified WHERE ProductID = @ProductID";

            if (FileImageUpload.PostedFile != null)
            {
                string Image = Path.GetFileName(FileImageUpload.PostedFile.FileName); //Get image path

                FileImageUpload.SaveAs(Server.MapPath("Image/" + Image)); //Save files to disk

                using (SqlCommand cmd = new SqlCommand(SQL, con))
                {
                    cmd.Parameters.AddWithValue("@Name", txtName.Text);
                    cmd.Parameters.AddWithValue("@CatID", ddlCategory.SelectedValue);
                    cmd.Parameters.AddWithValue("@Code", txtCode.Text);
                    cmd.Parameters.AddWithValue("@Description", txtDescription.Text);
                    cmd.Parameters.AddWithValue("@Image", "Image/" + Image);
                    cmd.Parameters.AddWithValue("@Price", txtPrice.Text);
                    cmd.Parameters.AddWithValue("@IsFeatured", ddlIsFeatured.SelectedValue);
                    cmd.Parameters.AddWithValue("@Available", 0);
                    cmd.Parameters.AddWithValue("@Criticallevel", txtCriticallevel.Text);
                    cmd.Parameters.AddWithValue("@Maximum", txtMaximum.Text);
                    cmd.Parameters.AddWithValue("@DateModified", DateTime.Now);
                    cmd.Parameters.AddWithValue("@ProductID", Request.QueryString["ID"].ToString());

                    cmd.ExecuteNonQuery();
                    Response.Redirect("Default.aspx");
                }
            }
        }
    }
}