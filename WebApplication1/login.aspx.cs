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
            if (Classes.PingHost.PingHostMethod("http://moriahconsultoria.ddns.net:83/WSPOR02.apw?WSDL") == true)
            {
                statusServer.ImageUrl = "/Imagens/online.png";
                LabelStatusServer.Text = "O Servidor está online";
            } else
            {
                statusServer.ImageUrl = "/Imagens/offline.png";
                LabelStatusServer.Text = "O Servidor está offline";
            }
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
            if (!CheckBox1.Checked)
            {
                Text1.Attributes.Add("autocomplete", "off");
                Text2.Attributes.Add("autocomplete", "off");
            }
        }

        protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
        {
            Text1.Attributes.Add("autocomplete", "on");
            Text2.Attributes.Add("autocomplete", "on");
        }
    }
}