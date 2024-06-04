<%-- 
    Document   : meuPerfil
    Created on : 16 de mai. de 2024, 11:50:29
    Author     : bruno.hgsilva3
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
        <link rel="stylesheet" href="stylePerfil.css">
        <title>Pefil</title>
    </head>
    <body>
        <%// mostra as opçoes de iframe alterar,excluir e o de apresentação
            String u = null;
            u = request.getParameter("email");
            String emailIndex = "index.jsp?email=" + u;
            String nomeloginApresentacao = "apresentacaoUsuario.jsp?email=" + u;
            String nomeloginAlterar = "carregaAlterarDados.jsp?email=" + u;
            String nomeloginExcluir = "exluirUsuario.html";
        %>

        <!-- ==========================================cabeçalho========================================== -->
        <header>
            <!--logo-->
            <a href="<%= emailIndex%>" class="logo"> Diver<br />Ticket<br /></a>
            <!--botoes header-->
        </header>
        <!-- ========================================================================================================================= -->
        <!-- ==========================================menu============================================= -->
        <section class="menu">

            <nav class="sub-menu">
                <a href="<%= nomeloginAlterar%>" class="link" target="centro">Alterar</a>
                <a href="<%= nomeloginExcluir%>" class="link" target="centro">Excluir</a>
            </nav>
        </section>
        <!-- =====================================================main=========================================================== -->
        <main>

            <iframe src="<%= nomeloginApresentacao%>" name="centro"></iframe>

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
