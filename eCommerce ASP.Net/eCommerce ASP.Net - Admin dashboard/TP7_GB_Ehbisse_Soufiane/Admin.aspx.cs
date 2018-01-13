using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TP7_GB_Ehbisse_Soufiane
{
    public partial class Admin : System.Web.UI.Page
    {
        public string UserName { get; set; }
        public string Passwd { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            UserName = "Admin";
            Passwd = "123456";

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
                if (Session["AdminSession"] != null)
                {
                    Response.Redirect("Dashboard_Clients.aspx");
                }
            }
        }
        protected void BtnSingIn_Click(object sender, EventArgs e)
        {
            if (TxtLogin.Text == UserName && TxtPasswd.Text == Passwd)
            {
                Session["AdminSession"] = "Admin";
                Response.Redirect("Dashboard_Clients.aspx");
            }
            else LblMsg.Text = "Pseudo/Mot de Passe Incorrect ";
        }
    }
}