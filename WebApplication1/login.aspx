<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="WebApplication1.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script>
        window.history.forward(1);
    </script>
    <link type="text/css" rel="stylesheet" href="Style/Reset.css" />
    <link type="text/css" rel="stylesheet" href="Content/bootstrap.css" />
    <link type="text/css" rel="stylesheet" href="Style/modelos.css" />
    <script src="https://code.jquery.com/jquery-2.2.2.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

</head>
<body>
    <form id="form1" runat="server" class="form-horizontal">
        <div id="cabecalho">
            <asp:Image ID="borda" runat="server" class="tamanhoMaximo" ImageUrl="~/Imagens/border2-com-texto-e-logo.png" />
            <!--<asp:Label ID="Titulo" class="posicaoAbsoluto posicaoTitulo" runat="server" Text="Portal do Cliente"></asp:Label>-->
            <!--<asp:Image ID="logo" runat="server" class="posicaoLogo posicaoAbsoluto" ImageUrl="~/Imagens/newlogo2.png" />-->
        </div>
        <div class="control-group posicaoLogin posicaoAbsoluto" id="divLogin">
            <fieldset class="scheduler-border posicaoFieldSet posicaoRelativo">
                <legend class="scheduler-border corFonteTituloFieldset"><strong>Informações do usuário</strong></legend>
                <asp:Image ID="Image2" runat="server" class="posicaoImage2 posicaoAbsoluto" ImageUrl="~/Imagens/img.png" />
                <asp:Label ID="Nome" class="posicaoCampos posicaoRelativo" runat="server" Text="Nome"></asp:Label>
                <br />
                <input class="posicaoText" id="Text1" runat="server" type="text" />
                <br />
                <br />
                <asp:Label class="posicaoCampos posicaoRelativo" ID="Label2" runat="server" Text="Senha"></asp:Label>
                <br />
                <input class="posicaoText" id="Text2" runat="server" type="password" />
                <br />
                <br />
                <asp:CheckBoxList class="posicaoCampos posicaoRelativo" ID="CheckBoxList1" runat="server">
                    <asp:ListItem>Lembrar-me?</asp:ListItem>
                </asp:CheckBoxList>
                <br />
                <asp:Button class="btn btn-secondary posicaoCampos posicaoRelativo" ID="Button1" runat="server" Text="Entrar" OnClick="Button1_Click" />
                <asp:LinkButton class="posicaoLinkButton" ID="LinkButton1" runat="server">Retornar para o site da Moriah</asp:LinkButton>
            </fieldset>
        </div>
        <div id="rodape" runat="server" class="rodape">
            <asp:Label ID="Label5" class="labelRodape" runat="server" Text="Moriah Consultoria"></asp:Label>
            <asp:Label ID="Label4" class="label2Rodape" runat="server" Text="Av. Pres. Epitácio Pessoa, 4985 - Tambaú, João Pessoa - PB, 58039-000"></asp:Label>
        </div>
        <div id="rodape2" runat="server" class="copyright">
            <asp:Label ID="Label3" runat="server" class="labelCopyright" Text="2017. Todos os direitos resevados."></asp:Label>
        </div>
    </form>
</body>
</html>

<!--Função jQuery de retorno de mensagem-->
<script type="text/javascript">
    function alertBootstrap() {
        $("#divAlertBootstrap").slideDown(500).delay(4000).slideUp(500);
    };
</script>