using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TP7_GB_Ehbisse_Soufiane
{
    public partial class Site_Admin : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void BtnDeconnection_Click(object sender, EventArgs e)
        {
            //Application.Lock();
            //Application["ActifsUsers"] = (int)Application["ActifsUsers"] - 1;
            //Application.UnLock();

            Session.Clear();
            Response.Redirect("Admin.aspx?Logout=1");
        }
    }
}