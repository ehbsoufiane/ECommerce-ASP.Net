using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TP7_GB_Ehbisse_Soufiane
{
    public partial class Clients_Products : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Pseudo"] == null)
            {
                Response.Redirect("SingIn.aspx?Erreur=1");
            }

            if (!IsPostBack)
            {
                ListView1.DataSource = ProductListeDataSource;
                ListView1.DataBind();

            }
        }
        //public double PrixTTC;
        protected void BtnBuy_Click(object sender, EventArgs e)
        {
            Button myButton = (Button)sender;
            HiddenField myHiddenField = (HiddenField)myButton.NamingContainer.FindControl("HiddenField1");
            DropDownList TxtQte = (DropDownList)myButton.NamingContainer.FindControl("TxtQte");
            //Label LblPu = (Label)myButton.NamingContainer.FindControl("LblPu");
            string NumArticle = myHiddenField.Value;
            string NumClient = null;

            DataView dv = (DataView)ClientsDataSource.Select(DataSourceSelectArguments.Empty);
            for (int i = 0; i < dv.Table.Rows.Count; i++)
            {
                string Pseudo = dv.Table.Rows[i]["Login"].ToString();
                if (Session["Pseudo"].ToString() == Pseudo)
                {
                    NumClient = dv.Table.Rows[i]["NumClient"].ToString();
                    //PrixTTC = Convert.ToDouble(LblPu.Text) * Convert.ToDouble(TxtQte.Text);
                    break;
                }
            }

            CommandesDataSource.InsertParameters["NumClient"].DefaultValue = NumClient;
            CommandesDataSource.InsertParameters["dateCmd"].DefaultValue = DateTime.Now.ToString();
            CommandesDataSource.InsertParameters["NumArticle"].DefaultValue = NumArticle;
            CommandesDataSource.InsertParameters["QteArticle"].DefaultValue = TxtQte.SelectedValue;
            CommandesDataSource.Insert();
            LblMsg.Text = "Thank you for shopping at our store. Your order is confirmed.";
            LblMsg.ForeColor = System.Drawing.Color.Green;
            LblMsg.Focus();
        }
    }
}