<%-- 
    Document   : excluirUsuario
    Created on : 16 de mai. de 2024, 13:52:01
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
        <title>Excluir</title>
    </head>
    <body>
        <%
            // 1 pegar os dados e colocar na variavel
            String u, s;
            u = request.getParameter("email");
            s = request.getParameter("senha");
            // 2 conectar com banco de dados
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conectado = DriverManager.getConnection("jdbc:mysql://localhost:3306/diver", "root", "p@$$w0rd");
                // deleta usuario se as condições estiver certa
                PreparedStatement st = conectado.prepareStatement("DELETE From usuario where email=? and senha=?");
                st.setString(1, u);
                st.setString(2, s);
                int resultado = st.executeUpdate();
                //vetifica se tem os dados do usuario

                // se o resultado for 0 é porque não foi encontrado 
                if (resultado == 0) {
        %>

        <script>
            alert("Usuario Não Existe");
            window.location.href = "exluirUsuario.html";
        </script>

        <%// se o resultado for 1 é porque o evnto existe e foi excluido
        } else {

        %>

        <script>
            alert("Usuario Excluido");
            window.top.location.href = "index.jsp";
        </script>

        <%                }
            } catch (Exception erro) {
                out.println(erro);

            }
        %>
    </body>
</html>
