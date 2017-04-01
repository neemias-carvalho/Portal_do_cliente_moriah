using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{

    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            ServiceReference1.WSPOR02SOAPClient ws = new ServiceReference1.WSPOR02SOAPClient();
            ServiceReference1.STINFOS STInfos = ws.AUTLST(Text1.Value.Trim(), Text2.Value.Trim());

            if (Convert.ToBoolean(STInfos.AINFOUSUARIOLOGADO[0]))
            {
                for (int i = 0; i <= STInfos.AINFOUSUARIOLOGADO.Count -1; i++)
                {
                    Session.Add(Convert.ToString(i), STInfos.AINFOUSUARIOLOGADO[i]);
                }
                Response.Redirect("home.aspx");
            }
            else
            {
                Response.Write("<div id=\"divAlertBootstrap\" style=\"width:100%; position:fixed; top:0px; margin: 0px; text-align:center; font-weight:bold; z-index:999; display: none;\" class=\"alert alert-danger\">" +
                    "Dados incorretos!</div>" +
                    "<script type=\"text/javascript\">window.onload=function(){alertBootstrap();};</script>");
            }
        }
    }
}