using System;
using System.Collections.Generic;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class home : System.Web.UI.Page
    {
        //Objetos públicos
        ServiceReference1.WSPOR02SOAPClient ws = new ServiceReference1.WSPOR02SOAPClient();
        ServiceReference1.STINFOSEDITADO infosEditado = new ServiceReference1.STINFOSEDITADO();

        protected void Page_Load(object sender, EventArgs e)
        {
            Classes.PingHost.PingHostMethod("moriahconsultoria.ddns.net:83/WSPOR02.apw?WSDL");

            if (Session["10"].ToString() != "")
            {
                imgPerfil.Src = "/Uploads/fotos/" + Session["10"].ToString();
                imgPerfilEditar.Src = "/Uploads/fotos/" + Session["10"].ToString();
            } else
            {
                imgPerfil.Src = "Imagens/imgprofile.png";
                imgPerfilEditar.Src = "Imagens/imgprofile.png";
            }
            
            if (Request.UrlReferrer == null)
            {
                Response.Redirect("/login.aspx");
            }

            try
            {
                Label1.Text = Session["2"].ToString();
                Label2.Text = Session["1"].ToString();
            }
            catch (NullReferenceException a)
            {
                a.ToString();
            }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Session.RemoveAll();
            Response.Redirect("/login.aspx");
        }

        //Abri caixa do perfil e mostra as informações do usuário
        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            caixaDoPerfil.Visible = true;
            campo1.Value = Session["8"].ToString();
            campo2.Value = Session["1"].ToString();
            campo3.Value = Session["3"].ToString();
            campo4.Value = Session["5"].ToString();
            campo5.Value = Session["7"].ToString();
            Page_Load(sender, e);
            caixaDoPerfilParaEdicao.Visible = false;
        }

        //Abri caixa do perfil de editar e mostra as informações do usuário
        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            caixaDoPerfilParaEdicao.Visible = true;
            campo6.Value = Session["8"].ToString();
            campo7.Value = Session["1"].ToString();
            campo8.Value = Session["3"].ToString();
            campo9.Value = Session["5"].ToString();
            campo10.Value = Session["7"].ToString();
            Page_Load(sender, e);
            caixaDoPerfil.Visible = false;
        }

        //Fecha os modals
        protected void Button1_Click(object sender, EventArgs e)
        {
            caixaDoPerfil.Visible = false;
            caixaDoPerfilParaEdicao.Visible = false;
        }

        //Atualiza informações do usuário
        protected void Button3_Click(object sender, EventArgs e)
        {
            //Carregamento da imagem
            carregarImagem();

            //Atualização do webservice com as novas informações coletas a partir dos campos
            infosEditado.CODCLI = Session["9"].ToString();
            infosEditado.USUARIO = Session["2"].ToString();
            infosEditado.EMPRESA = campo7.Value;
            infosEditado.EMAIL = campo8.Value;
            infosEditado.FONE = campo9.Value;
            infosEditado.CELULAR = campo10.Value;
            infosEditado.TITULOIMAGEM = Session["10"].ToString();
            ws.SETPERFIL(infosEditado);

            //Atualização do session com as novas informações coletas a partir dos campos
            Session["8"] = campo6.Value;
            Session["1"] = campo7.Value;
            Session["3"] = campo8.Value;
            Session["5"] = campo9.Value;
            Session["7"] = campo10.Value;

            //Atualizando o painel com as novas informações
            LinkButton3_Click(sender, e);

            Response.Write("<div id=\"divAlertBootstrap\" style=\"width:100%; position:fixed; top:0px; z-index:3000; margin: 0px; text-align:center; font-weight:bold; display: none;\" class=\"alert alert-success\">" +
                    "Informações atualizadas!</div>" +
                    "<script type=\"text/javascript\">window.onload=function(){alertBootstrap();};</script>");
        }

        //Definir tamanho da imagem
        public class Redefinir
        {
            public static string resizeImageAndSave(string imagePath, int largura, int altura, string prefixo)
            {
                System.Drawing.Image fullSizeImg = System.Drawing.Image.FromFile(imagePath);
                var thumbnailImg = new Bitmap(largura, altura);
                var thumbGraph = Graphics.FromImage(thumbnailImg);
                thumbGraph.CompositingQuality = System.Drawing.Drawing2D.CompositingQuality.HighQuality;
                thumbGraph.SmoothingMode = System.Drawing.Drawing2D.SmoothingMode.HighQuality;
                thumbGraph.InterpolationMode = System.Drawing.Drawing2D.InterpolationMode.HighQualityBicubic;
                var imageRectangle = new Rectangle(0, 0, largura, altura);
                thumbGraph.DrawImage(fullSizeImg, imageRectangle);
                string targetPath = imagePath.Replace(Path.GetFileNameWithoutExtension(imagePath), Path.GetFileNameWithoutExtension(imagePath) + prefixo);
                thumbnailImg.Save(targetPath, System.Drawing.Imaging.ImageFormat.Jpeg);
                thumbnailImg.Dispose();
                return targetPath;
            }
        }

        //Carregamento da imagem
        protected void carregarImagem()
        {
            if (FileUploadControl.PostedFile.ContentLength < 8388608)
            {
                try
                {
                    if (FileUploadControl.HasFile)
                    {
                        try
                        {
                            //Aqui ele vai filtrar pelo tipo de arquivo
                            if (FileUploadControl.PostedFile.ContentType == "image/jpeg" ||
                                FileUploadControl.PostedFile.ContentType == "image/png" ||
                                FileUploadControl.PostedFile.ContentType == "image/gif" ||
                                FileUploadControl.PostedFile.ContentType == "image/bmp")
                            {
                                try
                                {
                                    //Obtem o  HttpFileCollection
                                    HttpFileCollection hfc = Request.Files;
                                    for (int i = 0; i < hfc.Count; i++)
                                    {
                                        HttpPostedFile hpf = hfc[i];
                                        if (hpf.ContentLength > 0)
                                        {
                                            //Pega o nome do arquivo
                                            string nome = System.IO.Path.GetFileName(hpf.FileName);
                                            //Pega a extensão do arquivo
                                            string extensao = Path.GetExtension(hpf.FileName);
                                            //Gera nome novo do Arquivo numericamente
                                            string filename = string.Format("{0:00000000000000}", GerarID());
                                            //Caminho a onde será salvo
                                            hpf.SaveAs(Server.MapPath("~/uploads/fotos/") + filename + i + extensao);

                                            //Prefixo p/ img pequena
                                            //var prefixoP = "-p";
                                            //Prefixo p/ img grande
                                            var prefixoG = "-g";

                                            //pega o arquivo já carregado
                                            string pth = Server.MapPath("~/uploads/fotos/") + filename + i + extensao;

                                            //Redefine altura e largura da imagem e Salva o arquivo + prefixo
                                            //Redefinir.resizeImageAndSave(pth, 70, 53, prefixoP);
                                            Redefinir.resizeImageAndSave(pth, 172, 180, prefixoG);

                                            infosEditado.TITULOIMAGEM = filename + i.ToString() + extensao;
                                            Session["10"] = infosEditado.TITULOIMAGEM;
                                        }

                                    }
                                }
                                catch (Exception ex)
                                {
                                    ex.ToString();
                                }
                                // Mensagem se tudo ocorreu bem
                                StatusLabel.Text = "Imagem carregada com sucesso!";

                            }
                            else
                            {
                                // Mensagem notifica que é permitido carregar apenas 
                                // as imagens definida la em cima.
                                StatusLabel.Text = "É permitido carregar apenas imagens!";
                            }
                        }
                        catch (Exception ex)
                        {
                            // Mensagem notifica quando ocorre erros
                            StatusLabel.Text = "O arquivo não pôde ser carregado. O seguinte erro ocorreu: " + ex.Message;
                        }
                    }
                }
                catch (Exception ex)
                {
                    // Mensagem notifica quando ocorre erros
                    StatusLabel.Text = "O arquivo não pôde ser carregado. O seguinte erro ocorreu: " + ex.Message;
                }
            }
            else
            {
                // Mensagem notifica quando imagem é superior a 8 MB
                StatusLabel.Text = "Não é permitido carregar mais do que 8 MB";
            }
        }

        public Int64 GerarID()
        {
            try
            {
                DateTime data = new DateTime();
                data = DateTime.Now;
                string s = data.ToString().Replace("/", "").Replace(":", "").Replace(" ", "");
                return Convert.ToInt64(s);
            }
            catch (Exception erro)
            {
                erro.ToString();
                throw;
            }
        }

        //Sem foto de perfil
        protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
        {
            if (CheckBox1.Checked)
            {
                infosEditado.CODCLI = Session["9"].ToString();
                infosEditado.USUARIO = Session["2"].ToString();
                infosEditado.EMPRESA = campo7.Value;
                infosEditado.EMAIL = campo8.Value;
                infosEditado.FONE = campo9.Value;
                infosEditado.CELULAR = campo10.Value;
                infosEditado.TITULOIMAGEM = "";

                CheckBox1.Checked = false;
                Session["10"] = "";
                ws.SETPERFIL(infosEditado);
                Page_Load(sender, e);
                LinkButton3_Click(sender, e);
            }
        }
    }
}