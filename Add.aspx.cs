using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;
using System.IO;
public partial class Admin_Products_Add : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            GetCategory();
        }
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection(Util.GetConnection()))
        {
            con.Open();
            string SQL = @"INSERT INTO Products VALUES(@Name, @CatID, @Code,
                            @Description, @Image, @Price, @IsFeatured, @Available,
                            @Criticallevel, @Maximum, @Status, @DateAdded, @DateModified)";

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
                    cmd.Parameters.AddWithValue("@Status", "Active");
                    cmd.Parameters.AddWithValue("@DateAdded", DateTime.Now);
                    cmd.Parameters.AddWithValue("@DateModified", DBNull.Value);

                    cmd.ExecuteNonQuery();
                    Response.Redirect("Default.aspx");

                }
            }
        }
    }

    void GetCategory()
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
}