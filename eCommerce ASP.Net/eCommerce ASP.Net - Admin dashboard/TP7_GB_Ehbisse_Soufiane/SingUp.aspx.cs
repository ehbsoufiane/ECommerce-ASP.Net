using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TP7_GB_Ehbisse_Soufiane
{
    public partial class SingUp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void BtnSingUp_Click(object sender, EventArgs e)
        {
            try
            {
                ClientsDataSource.InsertParameters["Nom"].DefaultValue = TxtNom.Text;
                ClientsDataSource.InsertParameters["Prenom"].DefaultValue = TxtPrenom.Text;
                ClientsDataSource.InsertParameters["Adresse"].DefaultValue = TxtAdresse.Text;
                ClientsDataSource.InsertParameters["Ville"].DefaultValue = ListeVille.SelectedValue;
                ClientsDataSource.InsertParameters["Tel"].DefaultValue = TxtTele.Text;
                ClientsDataSource.InsertParameters["Login"].DefaultValue = TxtLogin.Text;
                ClientsDataSource.InsertParameters["Pass"].DefaultValue = TxtPasswd.Text;
                ClientsDataSource.Insert();
                LblMsg.Text = "Inscription Success";
                LblMsg.ForeColor = System.Drawing.Color.Green;
            }
            catch (Exception Err)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Javascript", string.Format("javascript:alert('{0}');", Err.Message), true);

            }
        }
        protected void TxtLogin_ServerValidate(object source, ServerValidateEventArgs args)
        {
            DataView dv = (DataView)ClientsDataSource.Select(DataSourceSelectArguments.Empty);
            args.IsValid = true;
            for (int i = 0; i < dv.Table.Rows.Count; i++)
            {
                string value = dv.Table.Rows[i][6].ToString();

                if (args.Value == value)
                {
                    args.IsValid = false;
                    break;
                }
            }
        }
    }
}