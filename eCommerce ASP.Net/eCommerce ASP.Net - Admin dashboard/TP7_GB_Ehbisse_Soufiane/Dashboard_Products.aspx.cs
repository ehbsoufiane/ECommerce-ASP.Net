using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TP7_GB_Ehbisse_Soufiane
{
    public partial class Dashboard_Products : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["AdminSession"] == null)
            {
                Response.Redirect("Admin.aspx?Erreur=1");
            }
        }

        protected void BtnAdd_Click(object sender, EventArgs e)
        {
            try
            {
                ProductsDataSource.InsertParameters["Designation"].DefaultValue = ((TextBox)GridView1.FooterRow.FindControl("TxtDesignation")).Text;
                ProductsDataSource.InsertParameters["Pu"].DefaultValue = ((TextBox)GridView1.FooterRow.FindControl("TxtPrixU")).Text;
                FileUpload fileUpload = ((FileUpload)GridView1.FooterRow.FindControl("FileUpload1"));
                if (fileUpload.HasFile)
                {
                    string extension = Path.GetExtension(fileUpload.PostedFile.FileName);
                    string fileName = DateTime.Now.ToString("_MMddyyyy_HHmmss") + extension;

                    //string fileName = Path.GetFileName(fileUpload.PostedFile.FileName);
                    fileUpload.SaveAs(Server.MapPath("ImagesData/" + fileName));
                    ProductsDataSource.InsertParameters["URLImage"].DefaultValue = "ImagesData/" + fileName;
                    LblMsg.Text = "Success";
                    LblMsg.ForeColor = System.Drawing.Color.Green;
                }
                ProductsDataSource.Insert();
                GridView1.PageIndex = GridView1.PageCount;
            }
            catch (Exception Err)
            {
                LblMsg.Text = Err.Message;
                LblMsg.ForeColor = System.Drawing.Color.Red;
            }
            
        }
        protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        {
            FileUpload FileUpload1 = (FileUpload)GridView1.FooterRow.FindControl("FileUpload1");
            CustomValidator CustomValidator1 = (CustomValidator)GridView1.FooterRow.FindControl("CustomValidator1");
            args.IsValid = false;
            double filesize = FileUpload1.FileContent.Length;
            if (filesize > 1000000)
            {
                CustomValidator1.ErrorMessage = "Invalid File, FileSize Limits Exceeded.";
                return;
            }
            string[] validFileTypes = { "bmp", "gif", "png", "jpg", "jpeg", "icon" };
            string ext = System.IO.Path.GetExtension(FileUpload1.PostedFile.FileName);

            CustomValidator1.ErrorMessage = "Invalid File, extension not in (" + string.Join(",", validFileTypes) + ")";
            foreach (string fileExt in validFileTypes)
            {
                if (ext == "." + fileExt)
                {
                    args.IsValid = true;
                    break;
                }
            }
        }
        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            Image img = (Image)GridView1.Rows[e.RowIndex].FindControl("Image1");

            string path = Server.MapPath(img.ImageUrl);
            FileInfo file = new FileInfo(path);
            if (file.Exists)
            {
                file.Delete();
            }
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                FileUpload FileUpload2 = (FileUpload)GridView1.Rows[e.RowIndex].FindControl("FileUpload2");
                if (FileUpload2.HasFile)
                {
                    string extension = Path.GetExtension(FileUpload2.PostedFile.FileName);
                    string fileName = DateTime.Now.ToString("_MMddyyyy_HHmmss") + extension;

                    FileUpload2.SaveAs(MapPath("ImagesData/" + fileName));
                    ProductsDataSource.UpdateParameters["URLImage"].DefaultValue = "ImagesData/" + fileName;
                }
                else
                {
                    Image img = (Image)GridView1.Rows[e.RowIndex].FindControl("Image1");
                    ProductsDataSource.UpdateParameters["URLImage"].DefaultValue = img.ImageUrl.Substring(img.ImageUrl.LastIndexOf(@"/") + 1);
                }
            }
            catch (Exception Err)
            {
                LblMsg.Text = Err.Message;
                LblMsg.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void ProductsDataSource_Selected(object sender, SqlDataSourceStatusEventArgs e)
        {
            if (e.AffectedRows < 1) LblMsg.Text = "No Data Found ...";
            else LblMsg.Text = string.Empty;
        }
    }
}