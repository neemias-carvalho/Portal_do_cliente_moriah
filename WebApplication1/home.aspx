<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="WebApplication1.home" %>

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
    <form runat="server">

        <!--Informações de login do Usuário-->
        <div>
            <nav class="navbar navbar-inverse navbar-fixed-top">
                <div class="container-fluid">
                    <!-- Brand and toggle get grouped for better mobile display -->
                    <div class="navbar-header-left">
                        <a class="navbar-brand">Portal do Cliente</a>
                    </div>
                    <!-- Collect the nav links, forms, and other content for toggling -->
                    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                        <ul class="nav navbar-nav navbar-right">
                            <li role="presentation" class="active"><a>
                                <asp:Label ID="Label2" runat="server" Text=""></asp:Label></a></li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                                    <div class="glyphicon glyphicon-user"></div>
                                    <asp:Label ID="Label1" runat="server" Text=""></asp:Label></a>
                                <ul class="dropdown-menu posicaoAbsoluto" runat="server">
                                    <li>
                                        <asp:LinkButton OnClick="LinkButton2_Click" ID="LinkButton2" runat="server">Perfil</asp:LinkButton></li>
                                    <li>
                                        <asp:LinkButton OnClick="LinkButton3_Click" ID="LinkButton3" runat="server">Editar Perfil</asp:LinkButton></li>
                                    <li><a href="#">Configurações</a></li>
                                    <li role="separator" class="divider"></li>
                                    <li>
                                        <asp:LinkButton OnClick="LinkButton1_Click" ID="LinkButton1" runat="server">Sair</asp:LinkButton></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
        </div>

        <!--Slides-->
        <div class="posicaoSlide">
            <div id="myCarousel" class="carousel slide" data-ride="carousel">
                <ol class="carousel-indicators">
                    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                    <li data-target="#myCarousel" data-slide-to="1"></li>
                    <li data-target="#myCarousel" data-slide-to="2"></li>
                    <li data-target="#myCarousel" data-slide-to="3"></li>
                </ol>

                <!-- Wrapper for slides -->
                <div class="carousel-inner" role="listbox">
                    <div class="item active">
                        <img src="Imagens/img1.jpg" alt="Chania" />
                        <div class="carousel-caption">
                            <h1>Olá Cliente!</h1>
                            <p>Seja bem-vindo ao Portal do Cliente Moriah</p>
                        </div>
                    </div>

                    <div class="item">
                        <img src="Imagens/img2.jpg" alt="Chania" />
                        <div class="carousel-caption">
                            <h1>Quem somos?</h1>
                            <p>A Moriah é uma empresa de assessoria em softwares de gestão (ERP), em particular o TOTVS Microsiga Protheus, sistema modulado, com mais de 20 (vinte) anos no mercado. </p>
                        </div>
                    </div>

                    <div class="item">
                        <img src="Imagens/img3.jpg" alt="Flower" />
                        <div class="carousel-caption">
                            <h1>O Portal</h1>
                            <p>Desenvolvido para proporciona a todos os usuários os recursos que a nossa empresa oferece.</p>
                        </div>
                    </div>

                    <div class="item">
                        <img src="Imagens/img4.jpg" alt="Flower" />
                        <div class="carousel-caption">
                            <h1>Moriah Consultoria</h1>
                            <p>Consultoria de qualidade!</p>
                        </div>
                    </div>
                </div>

                <!-- Left and right controls -->
                <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
                    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
                    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
        </div>

        <!--Recursos Moriah-->
        <div class="posicaoRecursos">
            <nav class="navbar navbar-default navbar-static">
                <div class="collapse navbar-collapse js-navbar-collapse">
                    <div class="navbar-header-right">
                        <a class="navbar-brand">Recursos</a>
                    </div>
                    <ul class="nav navbar-nav">
                        <li class="dropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown" href="#">Financeiro
                            <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="#">Títulos Baixados</a></li>
                                <li><a href="#">Títulos em Aberto</a></li>
                            </ul>
                        </li>
                        <li class="dropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown" href="#">Serviços e Solicitações
                            <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="#">Serviços Contratados</a></li>
                                <li><a href="#">Novos Serviços</a></li>
                                <li><a href="#">Solicitações</a></li>
                            </ul>
                        </li>
                        <li class="dropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown" href="#">Chamados
                            <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="#">Protheus</a></li>
                                <li><a href="#">Mobile</a></li>
                                <li><a href="#">Web</a></li>
                            </ul>
                        </li>
                        <li>
                            <asp:Button ID="Button2" runat="server" Text="Projetos & Desenvolvimento" class="btn btn-link" /></li>
                    </ul>
                </div>
            </nav>
        </div>

        <!--Mostrar Perfil-->
        <div runat="server" id="caixaDoPerfil" visible="false" class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <asp:ImageButton ID="ImageButton1" OnClick="Button1_Click" class="close" ImageUrl="~/Imagens/x.png" runat="server" />
                    <h4 class="modal-title">Perfil do Usuário</h4>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="col-xs-4 col-md-3">
                                <a class="thumbnail">
                                    <img id="imgPerfil" runat="server" src="Imagens/imgprofile.png" />
                                </a>
                            </div>
                            <div class="form-group col-md-4">
                                <label for="campo1">Nome do Usuário</label>
                                <input type="text" class="form-control" disabled="disabled" id="campo1" runat="server" />
                            </div>
                            <div class="form-group col-md-4">
                                <label for="campo2">Empresa</label>
                                <input type="text" class="form-control" disabled="disabled" id="campo2" runat="server" />
                            </div>
                            <div class="form-group col-md-4">
                                <label for="campo3">Email</label>
                                <input type="text" class="form-control" disabled="disabled" id="campo3" runat="server" />
                            </div>
                        </div>
                        <div class="col-xs-12">
                            <div class="form-group col-md-4">
                                <label for="campo4">Telefone</label>
                                <input type="text" class="form-control" disabled="disabled" id="campo4" runat="server" />
                            </div>

                            <div class="form-group col-md-4">
                                <label for="campo5">Celular</label>
                                <input type="text" class="form-control" disabled="disabled" id="campo5" runat="server" />
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <asp:Button ID="Button1" OnClick="Button1_Click" runat="server" class="btn btn-default" Text="Fechar" />
                </div>
            </div>
        </div>

        <!--Editar Perfil-->
        <div runat="server" id="caixaDoPerfilParaEdicao" visible="false" class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <asp:ImageButton ID="ImageButton2" OnClick="Button1_Click" class="close" ImageUrl="~/Imagens/x.png" runat="server" />
                    <h4 class="modal-title">Perfil do Usuário</h4>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="col-xs-4 col-md-3">
                                <a class="thumbnail">
                                    <img id="imgPerfilEditar" runat="server" src="Imagens/imgprofile.png" />
                                </a>
                                <div>
                                    <br />
                                    <asp:FileUpload ID="FileUploadControl" runat="server" class="multi" AllowMultiple="True" />
                                    <br />
                                    <asp:Label runat="server" ID="StatusLabel" Text="" ForeColor="Red" />
                                    <br />
                                    <asp:CheckBox ID="CheckBox1" AutoPostBack="true" OnCheckedChanged="CheckBox1_CheckedChanged" Text="Sem foto" runat="server" />
                                    <br />
                                </div>
                            </div>
                            <div class="form-group col-md-4">
                                <label for="campo6">Nome do Usuário</label>
                                <input type="text" class="form-control" disabled="disabled" id="campo6" runat="server" />
                            </div>
                            <div class="form-group col-md-4">
                                <label for="campo7">Empresa</label>
                                <input type="text" class="form-control" disabled="disabled" id="campo7" runat="server" />
                            </div>
                            <div class="form-group col-md-4">
                                <label for="campo8">Email</label>
                                <input type="text" class="form-control" id="campo8" runat="server" />
                            </div>
                        </div>
                        <div class="col-xs-12">
                            <div class="form-group col-md-4">
                                <label for="campo9">Telefone</label>
                                <input type="text" class="form-control" id="campo9" runat="server" />
                            </div>

                            <div class="form-group col-md-4">
                                <label for="campo10">Celular</label>
                                <input type="text" class="form-control" id="campo10" runat="server" />
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <asp:Button ID="Button3" OnClick="Button3_Click" runat="server" class="btn btn btn-primary" Text="Atualizar" />
                </div>
            </div>
        </div>

        <!--Rodapé-->
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
