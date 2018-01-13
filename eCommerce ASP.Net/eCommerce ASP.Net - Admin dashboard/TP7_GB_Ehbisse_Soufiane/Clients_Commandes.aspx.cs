using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TP7_GB_Ehbisse_Soufiane
{
    public partial class Clients_Commandes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Pseudo"] == null)
            {
                Response.Redirect("SingIn.aspx?Erreur=1");
            }

            DataView dv = (DataView)ClientsDataSource.Select(DataSourceSelectArguments.Empty);
            //string NumClient = null;
            for (int i = 0; i < dv.Table.Rows.Count; i++)
            {
                string Pseudo = dv.Table.Rows[i]["Login"].ToString();
                if (Session["Pseudo"].ToString() == Pseudo)
                {
                    HiddenField1.Value = dv.Table.Rows[i]["NumClient"].ToString();
                    break;
                }
            }
        }

        protected void ListCmdDataSource_Selected(object sender, SqlDataSourceStatusEventArgs e)
        {
            if (e.AffectedRows < 1) LblMsg.Text = "No Data Found ...";
            else LblMsg.Text = string.Empty;
        }
    }
}