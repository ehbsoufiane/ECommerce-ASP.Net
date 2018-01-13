using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TP7_GB_Ehbisse_Soufiane
{
    public partial class Dashboard_Clients : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["AdminSession"] == null)
            {
                Response.Redirect("Admin.aspx?Erreur=1");
            }
            //TxtSearch.Focus();
        }

        protected void ClientsDataSource_Selected(object sender, SqlDataSourceStatusEventArgs e)
        {
            if (e.AffectedRows < 1) LblMsg.Text = "No Data Found ...";
            else LblMsg.Text = string.Empty;
        }

        //protected void BtnSearch_Click(object sender, EventArgs e)
        //{
        //    TxtSearch.Focus();
        //}
    }
}