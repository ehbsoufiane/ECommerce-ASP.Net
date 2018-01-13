using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TP7_GB_Ehbisse_Soufiane
{
    public partial class Clients_Account : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Pseudo"] == null)
            {
                Response.Redirect("SingIn.aspx?Erreur=1");
            }
        }
    }
}