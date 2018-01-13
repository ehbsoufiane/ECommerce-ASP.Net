using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TP7_GB_Ehbisse_Soufiane
{
    public partial class Dashboard_Commandes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["AdminSession"] == null)
            {
                Response.Redirect("Admin.aspx?Erreur=1");
            }
            
        }

        protected void BtnSearchNum_Click(object sender, EventArgs e)
        {
            //CommandesListeDataSource.FilterExpression = "NumCmd = {0}";
            //CommandesListeDataSource.FilterParameters.Add("NumCmd", TxtSearchNum.Text);
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DropDownList1.SelectedValue == "1")
            {
                div1.Visible = true;
                div2.Visible = false;
                div3.Visible = false;
            }
            switch (DropDownList1.SelectedValue)
            {
                case "1":
                    div1.Visible = true;
                    div2.Visible = false;
                    div3.Visible = false;
                    div4.Visible = false;
                    break;
                case "2":
                    div1.Visible = false;
                    div2.Visible = true;
                    div3.Visible = false;
                    div4.Visible = false;

                    break;
                case "3":
                    div1.Visible = false;
                    div2.Visible = false;
                    div3.Visible = true;
                    div4.Visible = false;

                    break;
                case "4":
                    div1.Visible = false;
                    div2.Visible = false;
                    div3.Visible = false;
                    div4.Visible = true;

                    break;
            }
        }

        protected void BtnSearch_Click(object sender, EventArgs e)
        {
            CommandesListeDataSource.FilterParameters.Clear();
            switch (DropDownList1.SelectedValue)
            {
                case "1":
                    CommandesListeDataSource.FilterExpression = "NumCmd = {0}";
                    CommandesListeDataSource.FilterParameters.Add("NumCmd", TxtNumCmd.Text);
                    break;
                case "2":
                    CommandesListeDataSource.FilterExpression = "dateCmd = '{0}'";
                    CommandesListeDataSource.FilterParameters.Add("dateCmd",Convert.ToDateTime(TxtDate.Text).ToString("yyyy-MM-dd"));
                    break;
                case "3":
                    CommandesListeDataSource.FilterExpression = "dateCmd >= '{0}' AND dateCmd <= '{1}'";
                    CommandesListeDataSource.FilterParameters.Add("dateCmd", Convert.ToDateTime(TxtDate1.Text).ToString("yyyy-MM-dd"));
                    CommandesListeDataSource.FilterParameters.Add("dateCmd", Convert.ToDateTime(TxtDate2.Text).ToString("yyyy-MM-dd"));
                    break;
                case "4":
                    CommandesListeDataSource.FilterExpression = "NumClient = {0}";
                    CommandesListeDataSource.FilterParameters.Add("NumClient", TxtNumClient.Text);
                    break;
                default:
                    //CommandesListeDataSource.FilterExpression = "NumClient = ";
                    break;
            }
        }

        protected void CommandesListeDataSource_Selected(object sender, SqlDataSourceStatusEventArgs e)
        {
            if (e.AffectedRows < 1) LblMsg.Text = "No Data Found ...";
            else LblMsg.Text = string.Empty;
        }
    }
}