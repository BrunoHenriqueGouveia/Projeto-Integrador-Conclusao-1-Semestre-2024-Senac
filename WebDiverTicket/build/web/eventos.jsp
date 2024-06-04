<%-- 
    Document   : eventos
    Created on : 6 de mai. de 2024, 15:08:43
    Author     : bruno
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import= "java.sql.Connection"%>
<%@page import= "java.sql.DriverManager"%>
<%@page import= "java.sql.PreparedStatement"%>
<%@page import= "java.sql.ResultSet"%>
<%@page import= "java.sql.SQLException"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="styleEventos.css">
        <link rel="stylesheet" href="styleCards.css">
        <link rel="stylesheet" href="styleBtnLogin.css">
        <title>Eventos</title>
    </head>
    <body>
        <!-- ==========================================cabeçalho========================================== -->
        <%
            // recebe dados do usuario
            String u = null;
            u = request.getParameter("email");
            String emailIndex = "index.jsp?email=" + u;
            String emailEvento = "cadastroEvento.jsp?email=" + u;
            String emailMeusIngressos = "meusIngressos.jsp?email=" + u;
            String emailMeusEventos = "meuEvento.jsp?email=" + u;

        %>
        <header>
            <!--logo-->
            <a href="<%= emailIndex%>"  class="logo"> Diver<br />Ticket<br /></a>
            <!--botoes header-->
            <nav>
                <%
                    String emailPerfil = "meuPerfil.jsp?email=" + u;

                    // if para saber se o email que veio da outra pagina não esta null
                    // se tiver td certo mostra as opção de usuario logado
                    if (u != null) {
                        int a = u.indexOf("@");
                        String nome = u.substring(0, a);
                %>
                <div class="dropdown">
                    <button onclick="myFunction()" class="dropbtn"> <%=nome%> </button>
                    <div id="myDropdown" class="dropdown-content">
                        <a href= "<%=emailPerfil%>">Perfil</a>
                        <a href="<%=emailMeusIngressos%>">Meus Ingresso</a>
                        <a href="<%=emailMeusEventos%>">Meus eventos</a>
                    </div>
                </div>

                <a href="<%=emailEvento%>"<button class="button button2">Criar Eventos</button></a>

                <%
                    // se não mostra a opção sem esta logado
                } else {
                %>

                <a href="loginUsuario.html"><button class="button button1">Login</button></a>
                <%
                    }
                %>
            </nav>
            <!-- ==================================script dropdoow=================================================== -->
            <script>
                /* Quando o usuário clicar no botão, alterne entre ocultar e mostrar o conteúdo do menu suspenso */
                function myFunction() {
                    document.getElementById("myDropdown").classList.toggle("show");
                }

                // Feche o menu suspenso se o usuário clicar fora dele
                window.onclick = function (event) {
                    if (!event.target.matches('.dropbtn')) {
                        var dropdowns = document.getElementsByClassName("dropdown-content");
                        var i;
                        for (i = 0; i < dropdowns.length; i++) {
                            var openDropdown = dropdowns[i];
                            if (openDropdown.classList.contains('show')) {
                                openDropdown.classList.remove('show');
                            }
                        }
                    }
                };
            </script>
        </header>
        <!-- ========================================================================================================================= -->
        <!-- ==========================================menu============================================= -->
        <section class="menu">
            <div>
                <input type="text" placeholder="Pesquisar eventos,show,teatro..." title="Type in a name">
            </div>

            <nav class="sub-menu">
                <a href="cadastroUsuario.html" class="link">Cadastre-se</a>
                <a class="link">Contato</a>
                <a class="link">Ajuda</a>
            </nav>
        </section>
        <!-- =====================================================main=========================================================== -->
        <h2> Eventos</h2>

        <main>


            <%
                //  conectar com banco de dados
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection conectado = DriverManager.getConnection("jdbc:mysql://localhost:3306/diver", "root", "p@$$w0rd");
                    // busca todos os evento no banco de dados
                    PreparedStatement st = conectado.prepareStatement("select id_evento ,data_inicio,nomeDoevento,imagem from evento");
                    ResultSet resultado = st.executeQuery();//executa o select(busca)

                    // mostra todos os evento que estão no banco de dados
                    while (resultado.next()) {
                        String evento = "eventoExpecifico.jsp?idEvento=" + resultado.getInt("id_evento");

            %>

            <!--card eventos-->
            <div class="img-cards">
                <a href="<%=evento%>">
                    <img src="imgs/<%=resultado.getString("imagem")%>" >
                </a>
                <div class="desc">
                    <h3><%=resultado.getString("data_inicio")%></h3>
                    <h5> <%=resultado.getString("nomeDoEvento")%> </h5>
                </div>
            </div>


            <%

                    }
                } catch (ClassNotFoundException ex) {
                    out.print(ex);

                } catch (SQLException ex) {
                    out.print(ex);

                }
            %>

        </main>
        <!-- =============================================================================================================== -->
        <!--footer-->
        <footer>
            <!--links-->
            <a class="link">termo de uso</a>
            <a class="link">Política de privacidade</a>
            <a class="link">Política de reembolso</a>
            <!--logo em rodape-->
            <a href="<%= emailIndex%>" class="logo-rodape"> Diver<br />Ticket<br /></a>
            <a class="link">Perguntas Frequente</a>
            <a class="link">Informação de contatos</a>
            <a class="link">Sobre Nos</a>
        </footer>
        <!-- =============================================================================================================== -->

    </body>
</html>
