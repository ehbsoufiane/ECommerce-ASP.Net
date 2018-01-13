using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TP7_GB_Ehbisse_Soufiane
{
    public partial class SingIn : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            LblMsg.ForeColor = System.Drawing.Color.Red;
            if (!IsPostBack)
            {
                if (Request.QueryString["Erreur"] != null)
                {
                    LblMsg.Text = "Vous devez vous connecter pour accéder à votre espace!";
                }
                if (Request.QueryString["Logout"] != null)
                {
                    LblMsg.Text = "Vous avez été déconnecté avec succès";
                    LblMsg.ForeColor = System.Drawing.Color.Green;
                }
                if (Session["Pseudo"] != null)
                {
                    Response.Redirect("Clients_Account.aspx");
                }
            }
        }
        protected void BtnSingIn_Click(object sender, EventArgs e)
        {
            DataView dv = (DataView)ClientsDataSource.Select(DataSourceSelectArguments.Empty);
            bool IsValid = false;
            for (int i = 0; i < dv.Table.Rows.Count; i++)
            {
                string Pseudo = dv.Table.Rows[i]["Login"].ToString();
                string Passwd = dv.Table.Rows[i]["Pass"].ToString();

                if (Pseudo == TxtLogin.Text && Passwd == TxtPasswd.Text)
                {
                    IsValid = true;
                    Session["Pseudo"] = Pseudo;
                    break;
                }
            }
            if (IsValid) Response.Redirect("Clients_Account.aspx");
            else LblMsg.Text = "Pseudo/Mot de Passe Incorrect ";
        }
    }
}